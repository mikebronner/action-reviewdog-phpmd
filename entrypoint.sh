#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ]; then
    cd "${GITHUB_WORKSPACE}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

php /usr/local/bin/phpmd.phar ${INPUT_TARGET_DIRECTORY} ${INPUT_STANDARD}\
    | reviewdog -name=PHPMD -f=checkstyle -reporter=${INPUT_REPORTER} -level=${INPUT_LEVEL} -diff='git diff'
