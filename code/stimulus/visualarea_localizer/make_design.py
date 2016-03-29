#!/usr/bin/python
# Generate CSV files with a particular randomization for the visual localizer
# paradigm. it relies on the directory with the stimulus images located at
# 'img/' and generated a series of CSV files in the current directory. The
# PsychoPy implementation will use the particular design that is placed into
# a 'specs/' directory when the experiment is run.

from glob import glob
import numpy as np
import random
import copy
import csv

def fmt_img(fname):
    return fname.replace('img/', 'img/lcm/').replace('.png', '_lcm.png')

runs = 4
block_repeat = 2
double_trials = 8

categories = ['body', 'face', 'house', 'object', 'scene', 'scramble']

images = dict([(cat, glob('img/%s*.png' % cat)) for cat in categories])

block_csv_vars = ['img1', 'img2']

exp_csv = csv.writer(open('run_order.csv', 'w'))
exp_csv.writerow(['block_order_spec'])
for runidx in range(runs):
    run_csv_fname = 'run%.2i_block_order.csv' % (runidx,)
    run_csv = csv.writer(open(run_csv_fname, 'w'))
    exp_csv.writerow(['specs/%s' % run_csv_fname])
    run_csv.writerow(['image_order_spec', 'block_condition'])
    # block order list -- do not suffle globally to get even distribution
    blocks = []
    for br in range(block_repeat):
        c = copy.copy(categories)
        random.shuffle(c)
        blocks.extend(c)
    for blockidx, block in enumerate(blocks):
        block_csv_fname = 'run%.2i_block%.2i.csv' % (runidx, blockidx)
        run_csv.writerow(['specs/%s' % block_csv_fname, block])
        block_csv = csv.writer(open(block_csv_fname, 'w'))
        block_csv.writerow(block_csv_vars)
        bimgs = copy.copy(images[block])
        random.shuffle(bimgs)
        # where to place mirror images
        mirror_flags = np.repeat(0, double_trials)
        # up to two mirrors
        mirror_flags[:random.randint(0,2)] = 1
        random.shuffle(mirror_flags)
        for mf in mirror_flags:
            if mf:
                source = fmt_img(bimgs.pop())
                block_csv.writerow([source, source.replace('.png', '_mirror.png')])
            else:
                block_csv.writerow([fmt_img(bimgs.pop()),
                                    fmt_img(bimgs.pop())])

