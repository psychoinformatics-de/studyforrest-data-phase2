
check_physio()
{
    nvols=$1
    shift
    # minimum number of samples - enough for all but the fade out at the end
    target_length=$(( $(( $nvols * 2 * 500 )) - 0))
    for f in $@; do
        found_trigger="$(zgrep '^1' "$f" | wc -l)"
        assertEquals "Need to find each trigger in the log" "$nvols" "$found_trigger"
        found_length="$(zcat "$f" | wc -l)"
        assertTrue "Check for minimum length (need: $target_length; found: $found_length)" "[ $found_length -gt $target_length ]"
    done
}

test_physio_movielocalizer_run()
{
    check_physio 48 ./sub-*/ses-localizer/func/*_ses-localizer_task-movielocalizer_run-*_recording-cardresp_physio.tsv.gz
}
test_physio_retmap_runs()
{
    check_physio 90 ./sub-*/ses-localizer/func/*_ses-localizer_task-retmap_run-*_recording-cardresp_physio.tsv.gz
}

test_physio_localizer_runs()
{
    check_physio 156 ./sub-*/ses-localizer/func/*_ses-localizer_task-objectcategories_run-*_recording-cardresp_physio.tsv.gz
}

test_physio_movie_runs()
{
  count=1
  for nvols in 451 441 438 488 462 439 542 338; do
      check_physio $nvols ./sub-*/ses-movie/func/*_ses-movie_task-movie_run-${count}_recording-cardresp_physio.tsv.gz
      count=$(( $count + 1 ))
  done
}
