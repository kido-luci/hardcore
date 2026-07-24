Runtime
—
ms
Beats
—

## Topic (LeetCode)

Array · Binary Search

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 2/10 | "First index where `nums[i] >= target`" is nearly a restatement of the problem — `solution_1` proves it by finding that answer with a plain loop |
| ⌨️ Code | 7/10 | A half-open `[start, end)` binary search with `mid + 1` / `end = mid` is only a handful of lines, but trivial to get subtly wrong — `solution_3`'s own attempt shows how one missed `+1` turns a branch into a no-op |
| ⚠️ Traps | 8/10 | Inclusive vs. exclusive `end`, `mid` rounding down on a 2-element window, whether the loop condition alone can terminate — `solution_3` dodges all three with extra bailout checks instead of fixing the invariant |
| 🎯 Worth | 9/10 | This exact lower-bound template is the building block for 34, and for almost every "first/last index satisfying a condition" problem after it |

Headline `max(insight, code, traps)` = **8/10**.

## Why LeetCode tags this Binary Search

Only `solution_3` and `solution_4` actually run one. `solution_1` and `solution_2`
are O(n) linear scans that happen to also clear LeetCode's constraints — the tag
describes the *intended* O(log n) solution, not the two that pass without it.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Linear scan for the first element `>= target` | O(n) time · O(1) space |
| `solution_2.dart` | Same scan, but walked from both ends at once — checks `nums[i]` and `nums[length - 1 - i]` each iteration | O(n) time (same order as `solution_1`, roughly half the iterations) · O(1) space |
| `solution_3.dart` | Binary search that narrows `start`/`end` toward `mid`, but terminates through three separate bailout checks (`nums[start]`, `nums[end]`, `end - start == 1`) instead of the loop condition itself | O(log n) time · O(1) space |
| `solution_4.dart` | Textbook lower-bound binary search over the half-open `[start, end)`: `start = mid + 1` or `end = mid`, loop until `start == end` | O(log n) time · O(1) space |

`solution_3`'s own narrowing almost stalls: when `end - start == 1`, integer
division makes `mid == start`, so the `else` branch reassigns `start = mid` to
itself. It only terminates because of the three checks tacked on afterward, not
because the narrowing logic guarantees progress — exactly the off-by-one that
`solution_4` eliminates by switching to `mid + 1` and a half-open interval.
