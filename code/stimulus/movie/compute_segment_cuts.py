#!/usr/bin/python

import numpy as np

segments = np.recfromcsv('segment_timing.csv')
cuts = np.recfromcsv('cuts_wholemovie.csv')

for segment, start_frame, start_time in segments:
    print segment, start_frame, start_time
    segcuts = cuts[cuts['1st_shot_frame'] > segments['start_frame'][segment]]
    if segment < segments['segment'][-1]:
        segcuts = segcuts[segcuts['1st_shot_frame'] < segments['start_frame'][segment + 1]]
    segcuts = segcuts.copy()
    segcuts['cut_time'] -= start_time
    segcuts['1st_shot_frame'] -= start_frame
    np.savetxt(
        'cuts_segment{}.csv'.format(segment),
        segcuts,
        fmt=['%.2f', '%i'], delimiter=',',
        header=','.join(['"{}"'.format(i) for i in cuts.dtype.fields.keys()]),
        comments='')
