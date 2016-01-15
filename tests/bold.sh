
dtype="16"
volsize=" 80, 80, 35"
dimensions="3.00x3.00x3.30x2.00 sform"

test_bold_defacing()
{
    vals=""
    for f in $(find . -name '*_bold.nii*'); do
      vals="$vals\n$(python -c "import nibabel as nb; print(nb.load(\"$f\").dataobj[37,71,6].sum())")"
      assertEquals \
        "All BOLD images have to have the same unit" \
        "s " "$(fslval "$f" time_units)"
      assertEquals \
        "All BOLD images have to have the same unit" \
        "mm " "$(fslval "$f" vox_units)"
    done
    assertEquals \
      "This one voxel must be defaced for all scans" \
      " 0 " \
      "$(echo "$vals" | sort -u | tr '\n' ' ')"
}

test_bold_movie_runs()
{
  count=1
  for nvols in 451 441 438 488 462 439 542 338; do
    files="$(nib-ls $(find . -name "*task-movie_run-${count}_bold.nii*"))"
    assertEquals \
      "All BOLD images of run $count have to have the same basic properties" \
      "$(echo $files | sed -e 's/.* int//' | uniq)" \
      "$dtype [$volsize, ${nvols}] $dimensions"
    count=$((count + 1))
  done
}

test_bold_retmap_runs()
{
  files="$(nib-ls $(find . -name "*task-retmap*_bold.nii*"))"
  assertEquals \
    "All BOLD images have to have the same basic properties" \
    "$(echo $files | sed -e 's/.* int//' | uniq)" \
    "$dtype [$volsize, 90] $dimensions"
}

test_bold_visuallocalizer_runs()
{
  files="$(nib-ls $(find . -name "*task-object*_bold.nii*"))"
  assertEquals \
    "All BOLD images have to have the same basic properties" \
    "$(echo $files | sed -e 's/.* int//' | uniq)" \
    "$dtype [$volsize, 156] $dimensions"
}

test_bold_movielocalizer_run()
{
  files="$(nib-ls $(find . -name "*task-movielocalizer*_bold.nii*"))"
  assertEquals \
    "All BOLD images have to have the same basic properties" \
    "$(echo $files | sed -e 's/.* int//' | uniq)" \
    "$dtype [$volsize, 48] $dimensions"
}


