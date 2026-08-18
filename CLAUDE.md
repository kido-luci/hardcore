# hardcore — project rules

## A problem folder is a published URL — never nest or rename a shipped one

Every YouTube episode that has already gone out links to its solution file at
`https://github.com/kido-luci/hardcore/blob/main/lib/leetcode/<folder>/<file>`.
GitHub does not redirect a moved path, so introducing any directory between
`lib/leetcode/` and a problem folder — or renaming a folder an episode already
links to — turns every one of those links into a 404, silently, permanently,
and invisibly from inside the repo.

Naming (changed 2026-08-04): problem folders are **kebab-case** —
`<number>-<kebab-title>`, e.g. `76-minimum-window-substring` — so code links
need no `%20` encoding. The `<number>. <Title>` spaced folders are what is left
from before that date; the ones an episode already links to keep those names
FOREVER, because the ugliness of `%20` in an old link is cheaper than the 404 a
rename would buy.

What freezes a name is that **an episode has already published a link to it** —
not the problem number, and not the date the folder was created. A spaced folder
nothing links to yet may still be renamed to kebab-case, and should be, before
its episode's description is written; that is how `20. Valid Parentheses` became
`20-valid-parentheses` (2026-08-05), and why `15-3sum` was born kebab despite
its low number. Renaming one is still a change that needs its own explicit yes,
because the check — has an episode shipped this link? — cannot be run from
inside the repo.

A problem folder therefore sits **directly** under `lib/leetcode/`. Do not group
them by status, topic, difficulty, or anything else, however tidy the result
looks. The only subdirectory that belongs there is `template/`, which no link
points into. The queues of problems that are *not* solved yet stay outside and
untracked: `lib/scaffold/` (the warehouse of problems intended to be done),
`lib/pickup/` (the batch being worked right now), `lib/pending/` (pulled out of
pickup and parked), and `lib/no-dart/` (LeetCode ships no Dart snippet for
these, so they cannot be attempted).

**`lib/leetcode/` means solved, not filmed (changed 2026-08-18).** It used to
hold only the problems an episode had been made for, while everything else
waited in an ignored `lib/solved/` queue. Since not every solved problem becomes
an episode, that gate kept finished work out of the repo indefinitely, so
`lib/solved/` was dropped and its 73 folders moved in. Nothing in the rule above
softens as a result — it hardens. A folder's presence here used to imply that an
episode existed; now it implies nothing at all, so "has an episode already
shipped this link?" can never be answered by looking at the repo, and has to be
asked every single time.

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
- **Moving a folder** out of a local queue (`lib/scaffold/`, `lib/pickup/`,
  `lib/pending/`) into `lib/leetcode/` once the problem is solved — solved on
  LeetCode is enough, an episode is not required.
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
