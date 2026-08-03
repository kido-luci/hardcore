# hardcore — project rules

## Solutions are the author's work — never edit the code

Every `solution_*.dart` under `lib/leetcode/` was written by hand as practice.
Claude must not change what any of them does.

### Allowed without asking

- **Comments** inside a solution file — fixing a typo, tightening wording.
  Explanatory prose only.
- **`README.md`** for a problem — the four-axis write-up, scored against the
  anchor table in `RUBRIC.md` (private `leetcode-video-toolkit` repo).
- **Moving a folder** between `lib/leetcode/scaffold/` and
  `lib/leetcode/resolved/` when a problem is finished.
- **Scaffolding** a new problem folder: `problem.md` holding the title and the
  LeetCode link, plus `solution_1.dart` holding `class Solution {}`.

### Never, without an explicit yes for that exact change

- Any edit to a statement, expression, identifier, or control flow inside a
  `solution_*.dart` file — **including a line that is provably dead, wrong, or
  slower than it needs to be**.
- Deleting commented-out debugging code. It is kept on purpose, it is not
  explanatory prose, and it does not fall under the comment allowance above.
- Renaming a variable, even to satisfy a lint.

### Report it, do not fix it

When a review turns up a defect — a no-op statement, an off-by-one, a wasted
allocation, an approach that costs more than it saves — name the file and the
line, explain what is wrong, and stop there. Staying quiet about the defect is
not the goal; repairing it is what is out of bounds. Fixing a bug removes the
exercise, and the exercise is the only reason this repo exists.

Being certain the fix is correct is not a reason to apply it. It was correct the
time this rule was written for, too.

**Why:** 2026-08-04 — a review of `76. Minimum Window Substring` found
`start == i;` on line 45, a comparison sitting under a comment that says
assignment. It was repaired in the same pass that wrote the README, on the
strength of a reply that only supplied a Runtime/Beats number. The change was
correct, verified, and unwanted, and had to be reverted before the branch was
pushed.
