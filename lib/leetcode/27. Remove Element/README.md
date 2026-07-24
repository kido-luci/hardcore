Runtime
0
ms
Beats
100.00%

## Topic (LeetCode)

Array · Two Pointers

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 2/10 | Same read/write split as 26, just with a simpler predicate — keep the value if it's not `val`, no adjacency to reason about |
| ⌨️ Code | 2/10 | One loop, one write pointer, one comparison — no nested condition at all |
| ⚠️ Traps | 3/10 | It's easy to reach for shifting or a second array out of habit; the actual trick is that order doesn't matter, so a plain overwrite-and-advance is already correct |
| 🎯 Worth | 5/10 | Same idiom as 26 with a simpler predicate; slightly lower worth |

Headline `max(insight, code, traps)` = **3/10**.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Write pointer `j` copies forward every element that isn't `val`; the read pointer `i` scans once, no skip-ahead needed | O(n) time · O(1) extra space |
