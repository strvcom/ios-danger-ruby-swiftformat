Handle stale `.git` in subdirectories causing doubled file paths on CI.

## Changes

- Detect when `git rev-parse --show-toplevel` returns the current directory (indicating a stale `.git` in a monorepo subdirectory) and fall back to the parent repo root via `git -C .. rev-parse --show-toplevel`
- Add test covering the stale `.git` scenario where `ios/setup.swift` was incorrectly passed to SwiftFormat as `ios/ios/setup.swift`
