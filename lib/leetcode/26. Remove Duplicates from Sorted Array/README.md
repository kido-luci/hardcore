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
| 💡 Insight | 2/10 | "Sorted" means every duplicate run is adjacent, so a read pointer and a write pointer are the whole idea — one small reframing from "remove" to "overwrite in place" |
| ⌨️ Code | 2/10 | One loop, one counter, and an inner skip-while — barely more than a single pass |
| ⚠️ Traps | 3/10 | The inner while's `i < nums.length - 1` bound is the one place to slip; drop it and the last duplicate run reads past the array |
| 🎯 Worth | 6/10 | Read/write pointer idiom — the base for many in-place problems |

Headline `max(insight, code, traps)` = **3/10**.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Write pointer `count` copies each new value forward; an inner `while` advances the read pointer `i` past every element equal to the one just written | O(n) time (each index visited once, amortized) · O(1) extra space |
