import numpy as np
import os
from mvpa2.datasets import Dataset, vstack


def movie_dataset(
        subj, preproc=None,
        base_path=os.curdir,
        fname_tmpl='sub-%(subj)s/ses-movie/func/sub-%(subj)s_ses-movie_task-movie_run-%(run)i_recording-eyegaze_physio.tsv.gz'):
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
    base_path : path
      Base directory for input file discovery.
    fname_tmpl : str
      Template expression to match input files. Support dict expansion with
      'subj' and 'run' keys.

    Returns
    -------
    Dataset
      The dataset contains a number of attributes, most of which should be
      self-explanatory. The `ds.a.run_duration_deviation` attribute quantifies
      the eyegaze recording duration difference from the expected value (in
      seconds).
    """
    # in frames (hand-verified by re-assembling in kdenlive -- using MELT
    # underneath)
    seg_offsets = (0, 22150, 43802, 65304, 89305, 112007, 133559, 160261)
    movie_fps = 25.0
    eyegaze_sr = 1000.0  # Hz
    intersegment_overlap = 400  # frames

    segments = []
    for seg, offset in enumerate(seg_offsets):
        raw = np.recfromcsv(
            os.path.join(base_path, fname_tmpl % dict(subj=subj, run=seg + 1)),
            delimiter='\t',
            names=('x', 'y', 'pupil', 'movie_frame'))
        if not preproc is None:
            raw = preproc(raw)
        # glue together to form a dataset
        ds = Dataset(np.array((raw.x, raw.y, raw.pupil)).T,
                     sa=dict(movie_frame=raw.movie_frame))
        ds.sa['movie_run_frame'] = ds.sa.movie_frame.copy()
        # turn into movie frame ID for the entire unsegmented movie
        ds.sa.movie_frame += offset
        ## truncate segment time series to remove overlap
        if seg < 7:
            # cut the end in a safe distance to the actual end, but inside the
            # overlap
            ds = ds[:-int(intersegment_overlap / movie_fps * eyegaze_sr)]
        if seg > 0:
            # cut the beginning to have a seamless start after the previous
            # segment
            ds = ds[ds.sa.movie_frame > segments[-1].sa.movie_frame.max()]
        ds.sa['movie_run'] = [seg + 1] * len(ds)
        segments.append(ds)
    ds = vstack(segments)
    # column names
    ds.fa['name'] = ('x', 'y', 'pupil')
    ds.a['sampling_rate'] = eyegaze_sr
    ds.a['movie_fps'] = movie_fps
    return ds


def preprocess_eyegaze(eyegaze, blink_margin=200, filter_width=40):
    from scipy.ndimage.morphology import binary_dilation
    from scipy.ndimage.filters import median_filter

    mask = binary_dilation(np.isnan(eyegaze['x']), iterations=blink_margin)
    # filter x and y coordinate separately
    eyegaze['x'] = median_filter(eyegaze['x'], size=filter_width)
    eyegaze['y'] = median_filter(eyegaze['y'], size=filter_width)
    # blank blink margin
    eyegaze['x'][mask] = np.nan
    eyegaze['y'][mask] = np.nan
    return eyegaze
