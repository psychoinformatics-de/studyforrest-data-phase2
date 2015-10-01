test_eyegaze_movie_runs()
{
  count=1
  for nvols in 451 441 438 488 462 439 542 338; do
    # this number of movie frame we expect in the files
    target_frames=$(( $nvols * 2 * 25 ))
    # minimum number of samples - enough for all but the fade out at the end
    target_length=$(( $(( $nvols * 2 * 1000 )) - 4000))
    # apply known deviations
    [ $count -eq 4 ] && target_frames=$(( $target_frames + 1))
    [ $count -eq 6 ] && target_frames=$(( $target_frames + 1))
    [ $count -eq 7 ] && target_frames=$(( $target_frames + 27))
    [ $count -eq 8 ] && target_frames=$(( $target_frames - 65))
    found_frames=""
    for f in ./sub-*/ses-movie/func/*_ses-movie_task-movie_recording-eyegaze_run-${count}_physio.tsv.gz; do
        found_frames="$found_frames\n$(zcat "$f" | tail -q -n1 | cut -f 4,4)"
        found_length="$(zcat "$f" | wc -l)"
        assertTrue "Check for minimum length (need: $target_length; found: $found_length)" "[ $found_length -gt $target_length ]"
    done
    found_frames="$(echo $found_frames | sort -u | tr '\n' ' ')"
    target=" $target_frames "
    if [ -n "$(echo "$found_frames" | cut -d ' ' -f3,3)" ]; then
        # we tolerate at most one additional frame (actual TR was 2.00001)
        target="$target$(( $target_frames + 1)) "
    fi
    assertEquals \
      "All file need to cover the same number of frames" \
      "$target" \
      "$found_frames"
    count=$((count + 1))
  done
}


