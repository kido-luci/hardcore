# hardcore

Personal repo for practicing algorithms, data structures, and LeetCode
problems in pure Dart.

## Structure

- `lib/leetcode/` — one folder per solved problem, directly at this level
- `lib/leetcode/template/` — the empty folder a new problem is copied from
- `lib/model/` — reusable data structures (e.g. `ListNode` linked list)

Each problem folder is named `<number>. <LeetCode title>` and holds:

- `problem.md` — the problem title and its LeetCode link
- `solution_1.dart`, `solution_2.dart`, … — one file per approach
- `README.md` — four-axis rating, plus what separates the approaches

A problem folder is committed only once it is finished — `solution_1.dart`
holds a real solution and `README.md` is written. Work in progress stays local
and untracked, so everything committed here can be trusted to be solved.

### Problem folders are a public URL — do not move them

Every published YouTube episode links to its solution file at

```
https://github.com/kido-luci/hardcore/blob/main/lib/leetcode/<number>.%20<title>/<file>
```

GitHub does not redirect a path that moved, so nesting these folders under any
new directory turns every one of those links into a 404, silently and for good.
Treat `lib/leetcode/<number>. <title>/` as a published address rather than an
implementation detail.

## Requirements

- Dart SDK `^3.10.3`
