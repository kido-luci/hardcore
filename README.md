# hardcore

Personal repo for practicing algorithms, data structures, and LeetCode
problems in pure Dart.

## Structure

- `lib/leetcode/` — one folder per solved problem, directly at this level
- `lib/leetcode/template/` — the empty folder a new problem is copied from
- `lib/model/` — reusable data structures (e.g. `ListNode` linked list)

Each problem folder is named `<number>-<kebab-case-title>` (since 2026-08-04 —
e.g. `76-minimum-window-substring`; older folders are still `<number>. <LeetCode
title>`, and the ones a published episode links to stay that way for good, see
below) and holds:

- `problem.md` — the problem title and its LeetCode link
- `solution_1.dart`, `solution_2.dart`, … — one file per approach
- `README.md` — four-axis rating, plus what separates the approaches

A problem folder is committed only once it is finished — `solution_1.dart`
holds a real solution and `README.md` is written. Work in progress stays local
and untracked, so everything committed here can be trusted to be solved.

### Problem folders are a public URL — do not move or rename them

Every published YouTube episode links to its solution file at

```
https://github.com/kido-luci/hardcore/blob/main/lib/leetcode/<folder>/<file>
```

GitHub does not redirect a path that moved, so nesting these folders under a
new directory — or renaming one an episode already links to — turns every one
of those links into a 404, silently and for good. Treat each problem folder as
a published address rather than an implementation detail.

That is also why the naming convention could only change **going forward**:
folders are kebab-case for clean links (since 2026-08-04), while every folder a
published episode already links to keeps its spaced name forever. What decides
it is that link, not the problem number — a problem whose episode has not gone
out can still be renamed, which is how `20. Valid Parentheses` became
`20-valid-parentheses`.

## Requirements

- Dart SDK `^3.10.3`
