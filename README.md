# hardcore

Personal repo for practicing algorithms, data structures, and LeetCode
problems in pure Dart.

## Structure

- `lib/leetcode/resolved/` — problems that have a working solution
- `lib/leetcode/template/` — the empty folder a new problem is copied from
- `lib/model/` — reusable data structures (e.g. `ListNode` linked list)

One folder per problem, named `<number>. <LeetCode title>`:

- `problem.md` — the problem title and its LeetCode link
- `solution_1.dart`, `solution_2.dart`, … — one file per approach
- `README.md` — four-axis rating, plus what separates the approaches

A problem folder is committed only once it is finished — `solution_1.dart`
holds a real solution and `README.md` is written. Work in progress stays local
and untracked, so everything under `resolved/` can be trusted to be solved.

## Requirements

- Dart SDK `^3.10.3`
