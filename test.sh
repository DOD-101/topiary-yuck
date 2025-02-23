#!/usr/bin/env bash

export TOPIARY_CONFIG_FILE TOPIARY_LANGUAGES_DIR

TOPIARY_CONFIG_FILE="$(pwd)/languages.ncl"
TOPIARY_LANGUAGES_DIR="$(pwd)/languages/"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

failed=0
succeded=0

for f in ./tests/input_*.yuck; do
    test_name="${f#./tests/input_}"
    test_name="${test_name%.yuck}"

    printf "[TEST] %s" "$f"

    output="$(topiary format -l yuck -q "$TOPIARY_LANGUAGES_DIR/yuck.scm" <"$f")"

    diff_output="$(echo "$output" | diff - "./tests/expected_$test_name.yuck")"

    if [ -z "$diff_output" ]; then
        printf " $GREEN✓\n$NC"
        succeded=$((succeded + 1))
    else
        printf " $RED✗\n$NC"
        printf "%s\n" "$diff_output"
        failed=$((failed + 1))
    fi
done

printf "\nTest results: $GREEN%s$NC succeded, $RED%s$NC failed\n" "$succeded" "$failed"

exit "$failed"
