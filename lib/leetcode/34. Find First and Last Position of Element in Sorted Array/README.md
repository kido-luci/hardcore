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
| 💡 Insight | 5/10 | Binary search gets you to *an* index equal to `target` in O(log n); realizing the range still needs a linear crawl outward (or a second bound search) is the extra step beyond 35 |
| ⌨️ Code | 7/10 | Two index variables (`i`, `j`), a manual `j - i <= 1` stall-breaker, and two separate expansion loops each with their own bound check — plenty of places to swap a `<` for a `<=` |
| ⚠️ Traps | 8/10 | It still returns the right answer on every duplicate-heavy test case while quietly degrading to O(n) — the failure is in the complexity guarantee, not the output |
| 🎯 Worth | 8/10 | Locating both edges of a run in a sorted array shows up anywhere you need bounds, not just a single index — 35's lower-bound idea, doubled |

Headline `max(insight, code, traps)` = **8/10**.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Binary search narrows `[i, j]` until landing on any index equal to `target`, then walks two pointers outward (`left`/`right`) until the run of matches ends | O(log n) to find a match, O(k) to expand across the k occurrences of `target` — O(n) worst case when the whole array is `target`; O(1) space |

The `left > i` / `right < j` guards aren't array-bounds checks — they lean on the
invariant that binary search never narrows `[i, j]` past an index where
`nums[x] == target`, so the true range can never spill outside the current window.
The real cost is that the expansion itself is linear: an array of all `5`s turns
the expected O(log n) into O(n).
