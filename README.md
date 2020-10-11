# GitHub Action: Run PHPMD with ReviewDog

This action runs [PHP Mess Detector](https://phpmd.org) with [ReviewDog](https://github.com/reviewdog/reviewdog).

[![Test](https://github.com/GeneaLabs/action-reviewdog-phpmd/workflows/Test/badge.svg)](https://github.com/GeneaLabs/action-reviewdog-phpmd/actions?query=workflow%3ATest)
[![reviewdog](https://github.com/GeneaLabs/action-reviewdog-phpmd/workflows/reviewdog/badge.svg)](https://github.com/GeneaLabs/action-reviewdog-phpmd/actions?query=workflow%3Ahrysd)
[![depup](https://github.com/GeneaLabs/action-reviewdog-phpmd/workflows/depup/badge.svg)](https://github.com/GeneaLabs/action-reviewdog-phpmd/actions?query=workflow%3Adepup)
[![release](https://github.com/GeneaLabs/action-reviewdog-phpmd/workflows/release/badge.svg)](https://github.com/GeneaLabs/action-reviewdog-phpmd/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/GeneaLabs/action-reviewdog-phpmd?logo=github&sort=semver)](https://github.com/GeneaLabs/action-reviewdog-phpmd/releases)

## Inputs
### `github_token`
**Required**. Must be in form of `github_token: ${{ secrets.github_token }}`

### `level`
Optional. Report level for reviewdog [info,warning,error].
It's same as `-level` flag of reviewdog.

### `reporter`
Reporter of reviewdog command [github-pr-check,github-check,github-pr-review].
Default is github-pr-check.
It's same as `-reporter` flag of reviewdog.

### `standard`
Default is `cleancode,codesize,controversial,design,naming,unusedcode`. Can be one or more of these, they must not contain any spaces between them.

### `target_directory`
Default is `src`.
