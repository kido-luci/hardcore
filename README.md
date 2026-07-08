# hardcore

Personal repo for practicing algorithms, data structures, and LeetCode
problems in Dart / Flutter.

## Structure

- `lib/model/` — reusable data structures (e.g. `ListNode` linked list)
- `lib/leetcode/` — solutions, one folder per problem. Each folder holds:
  - `problem.md` — the problem statement
  - `solution_1.dart` — a solution
  - `execute.dart` — a runnable entry point with test cases
- `lib/main.dart` — Flutter app entry point

## Running a solution

Run a problem's `execute.dart` directly from the project root:

```bash
dart run lib/leetcode/Merge_Two_Sorted_Lists/execute.dart
```

## Requirements

- Dart / Flutter SDK `^3.10.3`
