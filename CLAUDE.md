# hardcore — project rules

## `lib/leetcode/<number>. <title>/` is a published URL — never nest it

Every YouTube episode that has already gone out links to its solution file at
`https://github.com/kido-luci/hardcore/blob/main/lib/leetcode/<number>.%20<title>/<file>`.
GitHub does not redirect a moved path, so introducing any directory between
`lib/leetcode/` and a problem folder turns every one of those links into a 404 —
silently, permanently, and invisibly from inside the repo.

A problem folder therefore sits **directly** under `lib/leetcode/`. Do not group
them by status, topic, difficulty, or anything else, however tidy the result
looks. The only subdirectories that belong there are `template/` and the local,
untracked `scaffold/` queue, neither of which any link points into.

**Why:** 2026-08-04 — a reorganisation moved all 21 solved problems into
`lib/leetcode/resolved/` and shipped. A `grep` for references found none, because
the only references live in YouTube descriptions that the repo cannot see. Every
published episode's code link broke, and the whole structure had to be reverted.
Before moving anything under `lib/leetcode/`, ask what outside the repo points at
it — the answer is not in the repo.

## Solutions are the author's work — never edit the code

Every `solution_*.dart` under `lib/leetcode/` was written by hand as practice.
Claude must not change what any of them does.

### Allowed without asking

- **Comments** inside a solution file — fixing a typo, tightening wording.
  Explanatory prose only.
- **`README.md`** for a problem — the four-axis write-up, scored against the
  anchor table in `RUBRIC.md` (private `leetcode-video-toolkit` repo).
- **Moving a folder** out of the local `lib/leetcode/scaffold/` queue up into
  `lib/leetcode/` when a problem is finished.
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
