# Changelog

Notable changes to this project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Breaking changes (😱!!!):
- Added support for PureScript 0.14 and dropped support for all previous versions (#13)

New features:

Bugfixes:

Other improvements:
- Changed default branch to `main` from `master`

## [v3.1.0](https://github.com/purescript-contrib/purescript-unsafe-reference/releases/tag/v3.1.0) - 2020-10-02

New features:
  - Adds `UnsafeRefEq` and `UnsafeRefEqFallback` newtypes. The first newtype uses unsafe reference equality as an equality check, while the second will try `unsafeRefEq` and fall back to an underlying `Eq` instance. This can provide a significant performance improvement in some situations. Implemented in [#7](https://github.com/purescript-contrib/purescript-unsafe-reference/pull/7) by @LiamGoodacre.

## [v3.0.1](https://github.com/purescript-contrib/purescript-unsafe-reference/releases/tag/v3.0.1) - 2018-06-23

- Added metadata including contributor guidelines
- Pushed latest release to Pursuit

## [v3.0.0](https://github.com/purescript-contrib/purescript-unsafe-reference/releases/tag/v3.0.0) - 2018-05-25

- Updated for 0.12

## [v2.0.0](https://github.com/purescript-contrib/purescript-unsafe-reference/releases/tag/v2.0.0) - 2017-04-03

- Updated for PureScript 0.11

## [v1.0.0](https://github.com/purescript-contrib/purescript-unsafe-reference/releases/tag/v1.0.0) - 2017-02-20

- Initial release
