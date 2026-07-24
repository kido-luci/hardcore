Runtime
1
ms
Beats
9.88%

## Topic (LeetCode)

Linked List · Recursion

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 2/10 | Merge two sorted lists into one sorted list — the idea is the problem statement, nothing to derive |
| ⌨️ Code | 4/10 | No dummy head here, but the same problem wearing a different hat: a closure-based `addNode`/`takeUntil` pair has to track the tail pointer and drain-vs-advance across three separate exit paths instead of one comparison loop |
| ⚠️ Traps | 4/10 | The two `takeUntil` calls bound on different things — list1's current value, then its next value — and there's a separate branch for handing off the leftover tail; swap a bound or skip that branch and it silently mis-orders or drops nodes |
| 🎯 Worth | 7/10 | Two-pointer merging on linked structures is the base move behind merge sort's merge step and any union of sorted iterators |

Headline `max(insight, code, traps)` = **4/10**.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Two-pointer merge via closures: `addNode` appends a freshly allocated node to the result, `takeUntil` drains list2 while its values stay ≤ a bound (list1's current or next value), interleaving the two lists instead of a plain `while (list1 && list2)` comparison loop | O(n + m) time — every node visited once · O(n + m) space |

The result is built from brand-new `ListNode`s rather than relinking the input
nodes, so it spends O(n + m) extra space where the standard splice-in-place
merge would need O(1).
