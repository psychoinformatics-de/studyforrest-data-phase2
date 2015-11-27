import numpy as np
from mvpa2.datasets import Dataset, vstack


def movie_dataset(subj, preproc=None):
    """
    Load eyegaze recordings from all runs a merge into a consecutive timeseries

    When merging intersegment-overlap is removed.

    Parameters
    ----------
    subj : str
      Subject code.
    preproc : callable or None
      Callable to preprocess a record array of the raw timeseries. The record
      array has the field 'x', 'y', 'pupil', and 'movie_frame'. It needs to
      return a record array with the same fields and must not change the
      sampling rate or number of samples.

    Returns
    -------
    Dataset
      The dataset contains a number of attributes, most of which should be
      self-explanatory. The `ds.a.run_duration_deviation` attribute quantifies
      the eyegaze recording duration difference from the expected value (in
      seconds).
    """
    # total duration of the total researchcut length (after removing
    # inter-segment overlap) is 7083.4s
    # the intersegment overlap is exactly 400 movie frames
    seg_durations = (902.0, 882.0, 876.0, 976.0, 924.0, 878.0, 1084.0, 673.4)
    movie_fps = 25.0
    eyegaze_sr = 1000.0
    intersegment_overlap = 400  # frames

    segments = []
    tdiff = []
    for seg, duration in enumerate(seg_durations):
        raw = np.recfromcsv(
            'sub-%s/ses-movie/func/sub-%s_ses-movie_task-movie_run-%i_recording-eyegaze_physio.tsv.gz'
            % (subj, subj, seg + 1),
            delimiter='\t',
            names=('x', 'y', 'pupil', 'movie_frame'))
        if not preproc is None:
            raw = preproc(raw)
        # glue together to form a dataset
        ds = Dataset(np.array((raw.x, raw.y, raw.pupil)).T,
                     sa=dict(movie_frame=raw.movie_frame))
        ## truncate segment time series to remove overlap
        ds.sa['movie_run_frame'] = ds.sa.movie_frame.copy()
        if seg < 7:
            # clip the last frames, equal to half of the inter-segment overlap
            ds = ds[ds.sa.movie_run_frame < (duration * movie_fps - intersegment_overlap / 2)]
        if seg > 0:
            # connect by next movie frame ID
            #ds = ds[ds.sa.movie_run_frame > (intersegment_overlap / 2)]
            # connect by eyetracking sample rate
            ds = ds[int(intersegment_overlap / 2 / movie_fps * eyegaze_sr):]
            # make segment-continuous movie frame counter
            ds.sa.movie_frame += (segments[-1].sa.movie_frame[-1] - ds.sa.movie_frame[0] + 1)
        if seg in (0, 7):
            tdiff.append(duration - len(ds) / eyegaze_sr - intersegment_overlap / movie_fps / 2)
        else:
            tdiff.append(duration - len(ds) / eyegaze_sr - intersegment_overlap / movie_fps)
        ds.sa['movie_run'] = [seg + 1] * len(ds)
        segments.append(ds)
    ds = vstack(segments)
    # column names
    ds.fa['name'] = ('x', 'y', 'pupil')
    ds.a['sampling_rate'] = eyegaze_sr
    ds.a['movie_fps'] = movie_fps
    ds.a['run_duration_deviation'] = tdiff
    return ds
