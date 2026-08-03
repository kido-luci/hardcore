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

A new problem starts as a folder directly under `lib/leetcode/` and moves into
`resolved/` once `solution_1.dart` holds a real solution and `README.md` is
written.

## Requirements

- Dart SDK `^3.10.3`
