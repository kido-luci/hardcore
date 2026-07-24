Runtime
—
ms
Beats
—

## Topic (LeetCode)

Array · Two Pointers · Binary Search

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 4/10 | Realizing a sorted array lets you discard an entire side — every pair using the current left, or the current right — after one comparison is the actual leap; the pointer mechanics are trivial once you see it |
| ⌨️ Code | 2/10 | One loop, two indices, one three-way branch on the sum — nothing to build |
| ⚠️ Traps | 3/10 | The one real trap is LeetCode's 1-indexed output — forget the `+ 1` on either `left` or `right` and it looks correct in a debugger but fails the checker |
| 🎯 Worth | 7/10 | The general-purpose version of the "discard a side" two-pointer idiom from 11 — the base case for reasoning about which side is safe to give up on |

Headline `max(insight, code, traps)` = **4/10**.

## Why LeetCode tags this Binary Search

The tag points at the alternative approach: for each fixed `left`, binary-search
the sorted remainder for `target - numbers[left]`, giving O(n log n). This
solution skips that search entirely — comparing `sum` against `target` and
discarding a whole side (`right--` or `left++`) exploits the same sortedness in
one linear sweep instead of one binary search per element.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Two pointers from both ends; move `right` down when the sum is too big, `left` up when it's too small, return both indices (1-based) on a match | O(n) time · O(1) space |

The final `return []` is unreachable under LeetCode's own guarantee of exactly one
solution — it exists only to keep the function total.
