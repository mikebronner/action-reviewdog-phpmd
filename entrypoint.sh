#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ]; then
    cd "${GITHUB_WORKSPACE}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

php /usr/local/bin/phpmd.phar ${INPUT_TARGET_DIRECTORY} xml ${INPUT_STANDARD}\
    | sed -r "s/^([^:]+:\d+)\s+/\1:/"
    | reviewdog -name=PHPMD -f=phpstan -reporter=${INPUT_REPORTER} -level=${INPUT_LEVEL} -diff='git diff'
