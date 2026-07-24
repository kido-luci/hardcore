Runtime
—
ms
Beats
—

## Topic (LeetCode)

Array · Dynamic Programming

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 4/10 | You have to flip the question from "if I buy today, when do I sell" to "if I sell today, what is the lowest price behind me". A real flip, but a small one |
| ⌨️ Code | 1/10 | One loop, two variables. Almost nothing to get wrong |
| ⚠️ Traps | 2/10 | Only the single-element array (the `length < 2` guard also covers empty, but LeetCode's `1 <= prices.length` never sends one) |
| 🎯 Worth | 7/10 | The running-minimum idea is the degenerate case of Kadane and of 1-D DP — it comes back in 198 and 53 |

Headline `max(insight, code, traps)` = **4/10**.

## Why LeetCode tags this Dynamic Programming

`solution_2` is a 1-D DP with the whole table collapsed away:

```
best[i] = max( best[i-1],  prices[i] − minBuy[i] )
```

`best` and `minBuy` are the two cells left after dropping the `dp` array.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Brute force over every buy–sell pair, pruned to only buy at a running minimum | O(n²) worst case — on a decreasing array every index is a new minimum |
| `solution_2.dart` | One pass: keep `minBuy`, update `best` when the price rises | O(n) time · O(1) space |

The pruning in `solution_1` is **correct** (the optimal buy day must be a running
minimum) but it does not rescue the complexity. Measured on a decreasing array:
n=8,000 → 15ms, n=32,000 → 247ms, extrapolating to n=100,000 ≈ 2.4 seconds.

The `prices[i] > prices[i - 1]` guard in `solution_2` is also **correct** (checked over
200,000 cases, 0 mismatches) but it is **slower** than the unguarded version on all three
data shapes — it trades one cheap `max` for an extra bounds-checked array read every
iteration.
