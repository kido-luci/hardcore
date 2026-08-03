Runtime
5
ms
Beats
87%

## Topic (LeetCode)

Hash Table · String · Sliding Window

## Four-axis rating

Per `RUBRIC.md` in the private leetcode-video-toolkit repo. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 7/10 | Sliding window is the pattern; the twist is *how to test validity in O(1)*. Comparing two 52-entry tables every step is the obvious version and it is O(52n). A single `match` counter replaces the comparison — but only if it counts filled slots rather than occurrences |
| ⌨️ Code | 8/10 | Above `35`/`34`/`209`, the current 7-anchors. Two count tables, a conditional increment, a shrink loop with three distinct cases, and window bookkeeping — more interacting parts than anything else solved here |
| ⚠️ Traps | 8/10 | `3`'s tier. Increment `match` on every occurrence instead of only when a slot is still open and surplus characters silently validate the window; shrink one step too far and a needed character leaves without `match` noticing |
| 🎯 Worth | 8/10 | With `209`/`238`/`42`. The capstone of a window family this repo already has six entries in — learning it reaches backwards into all of them |

Headline `max(insight, code, traps)` = **8/10**.

## The `match` counter is the problem

Everything else here is ordinary sliding window: grow right, shrink left, record.
The question the whole problem hangs on is the one asked once per character —
*is this window valid yet?*

Answer it by comparing `s_take` against `t_counters` and each step costs 52
comparisons. Answer it with a counter and it costs nothing. The counter is the
solution; the window is just the frame it sits in.

But it only works because of the condition on the increment:

```dart
if (t_counters[current_index] > s_take[current_index]) {
  match++;
}
s_take[current_index]++;
```

`match` counts **slots filled**, not **characters seen**. A third `A` when `t`
wanted two does bump `s_take` — the surplus has to be tracked, or the shrink
loop cannot know it is free to drop it — but it must not bump `match`.

Drop that `if` and `match` starts overcounting; a window with three `A`s and no
`B` reports itself valid. It still returns `BANC` on the sample. That is the
shape of nearly every wrong answer to this problem.

## Three cases, and only the middle one is interesting

The shrink loop decides, for the character at `start`, whether the window can
afford to lose it:

| Case | Test | Action |
|---|---|---|
| Not in `t` at all | `t_counters[idx] == 0` | drop it, free |
| In `t`, and we hold surplus | `s_take[idx] > t_counters[idx]` | drop it, `match` unaffected |
| In `t`, and we hold exactly enough | otherwise | **stop** — this character is load-bearing |

The middle case is what makes the window *minimal* rather than merely valid.
Without it the loop stops at the first `t` character it meets and every window
comes back padded with duplicates it never needed.

Shrinking happens **before** the window is recorded, not after, so what gets
measured is already minimal for that right edge.

## Counting into an array, not a map

`t_counters` and `s_take` are `List.filled(52, 0)`, and `counterIndex` folds the
ASCII gap between `Z` (90) and `a` (97) shut:

```dart
codeUnit - 65 - (codeUnit < 97 ? 0 : 6)
```

`A-Z` lands on 0–25, `a-z` on 26–51. Choosing an array over a `HashMap` is the
right call and is most of the 5ms — a map pays hashing on every character of a
100 000-length input.

The 52 slots are the part worth arguing with. `List.filled(128, 0)` indexed
directly by `codeUnit` would save 76 integers less, and in exchange delete the
function call and the branch that currently run once per character. The saving
is in the axis that was already free; the cost lands on the one that runs
100 000 times. Kept as written, and noted here rather than quietly changed.

## Where it sits in the window family

| | Window state | What ends the shrink |
|---|---|---|
| 3 | last index seen per character | the duplicate's own position — the left edge jumps |
| 209 | running sum | sum drops below target |
| 1004 | count of zeros, `k` free | zero count back within `k` |
| 1493 | count of zeros, `k = 1` | one step, or none |
| 424 | count of every character | one step, with a stale maximum |
| **76** | **two tables plus a filled-slot counter** | **a character the window cannot afford to lose** |

Every other entry shrinks on a number going out of range. This one shrinks until
removing anything more would break a requirement — the first in the family whose
stopping condition is a *property of the contents*, not a threshold.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Grow the right edge one character at a time, tracking filled slots in `match`; once `match` reaches `t.length`, shrink from the left past everything the window can afford to lose, then record | O(n + m) time — `start` only advances, so the shrink loop is amortized across the whole scan · O(1) space, two fixed 52-slot tables |
