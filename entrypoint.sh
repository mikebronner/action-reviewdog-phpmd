#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ]; then
    cd "${GITHUB_WORKSPACE}" || exit
    git config --global --add safe.directory "${GITHUB_WORKSPACE}" || exit 1
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

excludeOption=""
if [ "$INPUT_EXCLUDE" != "" ]; then
    excludeOption=" --exclude $INPUT_EXCLUDE"
fi;

baselineFileOption=""
if [ "$INPUT_BASELINE_FILE" != "" ]; then
    baselineFileOption=" --baseline-file $INPUT_BASELINE_FILE"
fi;

php /usr/local/bin/phpmd.phar ${INPUT_TARGET_DIRECTORY}${excludeOption}${baselineFileOption} text ${INPUT_STANDARD} \
    | sed -r "s/([0-9]+)\s+/\1:/gI" \
    | reviewdog -name="${INPUT_NAME}" -f=phpstan -reporter=${INPUT_REPORTER} -level=${INPUT_LEVEL} -diff='git diff'
