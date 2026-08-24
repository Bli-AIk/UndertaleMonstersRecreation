# Contributing

## Repo layout: upstream vs fork code

- `Import UndertaleMonstersRecreation v1.1.1 ...` and `Import Mouse Hole
  content ...` are byte-identical upstream imports. **Never edit either import
  commit.** Upstream files are not to be re-licensed (see
  `LICENSE-UPSTREAM.md`).
- All portability and feature commits after those imports are fork code. For
  fixes that mirror upstream (e.g. Kristal 0.11 ports), prefer porting the
  upstream commit in a `git cherry-pick`-style change with a `Co-authored-by:`
  trailer, and record it in `CHANGELOG.md`.

## Land rules

- New files ⇔ covered by MIT OR Apache-2.0 (the fork license). Do **not** add
  license headers to upstream files.
- Editing an upstream file is allowed only with a clear rationale, a
  `Co-authored-by` credit where applicable, and a README/CHANGELOG note.
- Translations: only add `lang/zh_hans.json` entries sourced from the
  referenced translation provenance (see README). Entries that are not covered
  by the UT key-value extraction (「真是滑稽了啊」/ 好人汉化组) or the
  gm3dr Deltarune 汉化, including Mouse Hole dialogue, **must be reviewed by
  the maintainer** before merging.
- CI checks (Kristal update check + upstream drift check) must not be bypassed;
  updating `.github/upstream-facts.json` pins requires a reviewed upstream diff
  (`UPSTREAM.md` documents the recompute commands).

## Dev setup

- Local Kristal 0.11-dev checkout pinned at `f62afea` (see README support
  table). Smoke-test with a mod that loads MagicalGlassRedux +
  UndertaleMonstersRecreation.
