#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ]; then
    cd "${GITHUB_WORKSPACE}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

php /usr/local/bin/phpmd.phar ${INPUT_TARGET_DIRECTORY} text ${INPUT_STANDARD}\
    | sed -r "s/([0-9]+)\s+/\1:/gI"
    | reviewdog -name=PHPMD -f=phpstan -reporter=${INPUT_REPORTER} -level=${INPUT_LEVEL} -diff='git diff'
