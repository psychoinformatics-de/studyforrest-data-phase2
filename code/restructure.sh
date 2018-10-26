#!/bin/bash

# This script is intended to restructure and/or rename contents of the
# studyforrest-phase2 dataset into future BIDS compatibility with BIDS Extension
# Proposal 20 (BEP020
# https://docs.google.com/document/d/1eggzTCzSHG3AEKhtnEDbcdk-2avXN6I94X8aUPEBVsw/edit#).
# To execute run the following datalad run command:
# datalad run --input 'sub*/*/*/sub*_task-movie_run*_events*' --input
# 'sub*/*/*/sub*_task-movie_run*eyelink*' --input
# 'sub*/*/*/sub*_task-movie_run*eyegaze*' 'code/restructure.sh'

set -e
set -u

##create eyetrack dir if it doesn't exist
#initial_dir=/home/adina/Repos/studyforrest-data-phase2
initial_dir='../studyforrest-data-phase2'
subs=$(find -type d -name "sub-*" -printf "%f\n" | sort)
for sub in $subs; do
    root_dir=${initial_dir}/${sub}/ses-movie/
    eyetrack_dir=${root_dir}/eyetrack/
    [ ! -d "$eyetrack_dir" ] && mkdir -p "$eyetrack_dir";
    [ ! -d "$eyetrack_dir/sourcedataa" ]  && mkdir -p "$eyetrack_dir/sourcedata";
    [ ! -d "$eyetrack_dir/derivatives" ] && mkdir -p "$eyetrack_dir/derivatives";
done

#move raw and derived eyetracking data into respective sub/eyetrack/ directories

for sub in $subs; do
    if [ ! -d ${initial_dir}/${sub}/beh ]; then
        mv ${initial_dir}/${sub}/ses-movie/func/${sub}_ses-movie_task-movie_run-*_eyelinkraw.asc.gz ${initial_dir}/${sub}/ses-movie/eyetrack/sourcedata/
        mv ${initial_dir}/${sub}/ses-movie/func/${sub}_ses-movie_task-movie_run-*recording-eyegaze_physio* ${initial_dir}/${sub}/ses-movie/eyetrack/derivatives/
        mv ${initial_dir}/${sub}/ses-movie/func/${sub}_ses-movie_task-movie_run-*events* ${initial_dir}/${sub}/ses-movie/eyetrack/sourcedata ;
    fi
    if [ -d ${initial_dir}/${sub}/beh ]; then
        mv ${initial_dir}/${sub}/beh/${sub}_task-movie_run-*event*  ${initial_dir}/${sub}/ses-movie/eyetrack/sourcedata
        mv ${initial_dir}/${sub}/beh/${sub}_task-movie_run-*eyelink* ${initial_dir}/${sub}/ses-movie/eyetrack/sourcedata
        mv ${initial_dir}/${sub}/beh/*physio* ${initial_dir}/${sub}/ses-movie/eyetrack/derivatives;
        mv ${initial_dir}/${sub}/*beh.json ${initial_dir}/${sub}/ses-movie/eyetrack;
        rm -r -f ${initial_dir}/${sub}/beh
    fi
done

#rename raw data
for sub in $subs; do
    for i in $(find $sub/ses-movie/eyetrack/sourcedata -name '*eyelinkraw*'); do
        mv $i $(echo $i | sed -e 's/eyelinkraw/eyetrack/')
    done
    for i in $(find $sub/ses-movie/eyetrack/sourcedata -name '*task-movie*'); do
        mv $i $(echo $i | sed -r 's/task-movie_/task-avmovie_/');
    done
done


#rename the deriv data
for sub in $subs; do
    for i in $(find $sub/ses-movie/eyetrack/derivatives -name '*recording-eyegaze_physio*'); do
        mv $i $(echo $i | sed -e 's/task-movie_/task-avmovie_/');
    done
done

#unify naming of lab subj data
for sub in sub-22 sub-23 sub-24 sub-25 sub-26 sub-27 sub-28 sub-29 sub-30 sub-31 sub-32 sub-33 sub-34 sub-35 sub-36; do
    for i in $(find ${sub}/ses-movie/eyetrack/derivatives -name '*recording-eyegaze_physio*'); do
        mv $i $(echo $i | sed -e 's/task-avmovie_/ses-movie_task-avmovie_/');
    done
    for i in $(find ${sub}/ses-movie/eyetrack/sourcedata -name '*run*'); do
        mv $i $(echo $i | sed -e 's/task/ses-movie_task/');
    done
    for i in $(find ${sub}/ses-movie/eyetrack -name '*beh.json'); do
        mv $i $(echo $i | sed -e 's/task-movie_beh/ses-movie_task-avmovie_eyetrack/');
    done
done

list_include_item() {
  local list="$1"
  local item="$2"
  if [[ $list =~ (^|[[:space:]])"$item"($|[[:space:]]) ]] ; then
    # yes, list include item
    result=0
  else
    result=1
  fi
  return $result
}


#generate _eyetrack.json file based on whether subject has lab or scanner data
mri="sub-01 sub-02 sub-03 sub-04 sub-05 sub-06 sub-09 sub-10 sub-14 sub-15 sub-16 sub-17 sub-18 sub-19 sub-20"
for sub in $subs; do
    if `list_include_item "sub-01 sub-02 sub-03 sub-04 sub-05 sub-06 sub-09 sub-10 sub-14 sub-15 sub-16 sub-17 sub-18 sub-19 sub-20" "${sub}"`; then
    cat <<EOT > ${initial_dir}/${sub}/ses-movie/eyetrack/sourcedata/${sub}_ses-movie_task-avmovie_eyetrack.json
{
    "SamplingFrequency": 1000,
    "FileFormat": "*.asc.gz",
    "StartMessage": "<TODO>",
    "EndMessage": "<TODO>",
    "EventIdentifier": "custom log message at onset of every movie frame",
    "InstitutionName": "Psychoinformatics Lab",
    "InstitutionAddress": "Otto-von-Guericke-Universitaet, Universitaetsplatz 2, Building 23, Magdeburg, D-39106",
    "Manufacturer": "SR-Research",
    "ManufacturersModelName": "Eye-link 1000",
    "SoftwareVersions": 4.594,
    "TaskDescription": "Participants watch the movie 'Forrest Gump' in eight segments",
    "Instructions": "Enjoy the movie",
    "CalibrationTyoe": "13-point sequence",
    "RecordedEye": "Left",
    "AverageCalibrationError": 0.5753018209378478
}
EOT
    else
    cat <<EOT >${initial_dir}/${sub}/ses-movie/eyetrack/sourcedata/${sub}_ses-movie_task-avmovie_eyetrack.json
{
    "SamplingFrequency": 1000,
    "FileFormat": "*.asc.gz",
    "StartMessage": ,
    "EndMessage": ,
    "EventIdentifier": ,
    "InstitutionName": "Psychoinformatics Lab",
    "InstitutionAddress": "Otto-von-Guericke-Univer,
    "Manufacturer": "SR-Research",
    "ManufacturersModelName": "Eye-link 1000",
    "SoftwareVersions": 4.594,
    "TaskDescription": "Participants watch the movie 'Forrest Gump' in eight segments",
    "Instructions": "Enjoy the movie",
    "CalibrationTyoe": "13-point sequence",
    "RecordedEye": "Left",
    "AverageCalibrationError": 0.4534103524447244

}
EOT
    fi
done


#create .bidsignore file for all files not yet supported in BIDS

cat <<EOT >${initial_dir}/.bidsignore
ISSUES
LICENSE
Makefile
README.rst
README
tests/
EOT

#create data dictionary for participants.tsv file
cat <<EOT >${initial_dir}/participants.json
{
    "gender": "Gender (m = male, f = female)",
    "age": "Age, specified in age groups of 5 years",
    "handedness": "r = right, l = left",
    "hearing_problems_current": "n = no, y = yes",
    "hearing_problems_past": "n = no, y = yes",
    "vision_problems_current": "n = no, y = yes",
    "vision_problems_past": "n = no, y = yes",
    "forrest_seen": "n = no, y = yes",
    "forrest_seen_dist": "time since the last time the movie was watched",
    "forrest_seen_count": "number of previous viewing of the movie",
    "forrest_seen_languages": "language(s) the movie was previously seen in",
    "forrest_ad_known": "audio-version known? n = no, y = yes",
    "forrest_av_rating": "average rating",
    "forrest_av_storydepth": "subjective rating of story depth",
    "forrest_av_fatigue": "subjective rating of fatique",
    "forrest_av_feeling": "average subjective feeling",
    "forrest_av_artist_count": "average artist count"
}
EOT


#generate README in derivatives directory
for sub in $subs; do
    cat << EOT >${initial_dir}/${sub}/ses-movie/eyetrack/derivatives/README
    studyforrest-phase2/sub*/ses-movie/eyetrack/derivatives/

    This directory contains the following files:
    - sub-{subid}_ses-movie_task-avmovie_run-{runid}_recording-eyegaze_physio.tsv.gz:
      A .tsv file with columns "x", "y", "pupil_dil", "movieframe:idx" (no
      header)
EOT
done

