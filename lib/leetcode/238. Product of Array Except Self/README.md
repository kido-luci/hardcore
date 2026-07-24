Runtime
—
ms
Beats
—

## Topic (LeetCode)

Array · Prefix Sum

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 7/10 | The first insight is prefix × suffix — every index's answer is just everything to its left times everything to its right; getting to O(1) extra space needs a second insight, accumulating both directions into the same output array |
| ⌨️ Code | 4/10 | Two passes with one running product each once the shape clicks, but every draft here (`solution_2` through `solution_4`) reaches for an extra data structure — a map, then two arrays — before `solution_5` collapses it to one |
| ⚠️ Traps | 5/10 | Boundary indices (`i <= 0`, `i >= length - 1`) need explicit 1-fallbacks in every solution here, and it's easy to get the off-by-one wrong on the first pass — `solution_3` goes further and short-circuits once a running product hits zero, which only pays off if that interaction is reasoned through carefully |
| 🎯 Worth | 8/10 | Prefix/suffix accumulation without division shows up anywhere you need "everything except this one" — the same shape as running sums and self-excluding aggregates |

Headline `max(insight, code, traps)` = **7/10**.

## Why LeetCode tags this Prefix Sum

`solution_5.dart` runs the prefix accumulation twice, in opposite directions, into the
same array:

```
lefts[j] = left; left *= nums[j];       // pass 1: left → right, running prefix product
lefts[j] *= right; right *= nums[j];    // pass 2: right → left, running suffix product
```

Both passes are exactly the "running total so far" of a prefix sum — just multiplied
instead of added, and run twice so every index ends up holding left-product ×
right-product instead of a single running total.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Brute force: for each index, multiply everything to its left and everything to its right in two inner loops | O(n²) time · O(1) extra space |
| `solution_2.dart` | Precompute prefix and suffix products into two `Map<String, int>`s keyed by index ranges (`'0_$j'`, `'$j_$last'`), then look each one up per index | O(n) time · O(n) space |
| `solution_3.dart` | Same map-based prefix/suffix idea, with an early-exit once both running products hit zero and a `0` fallback (instead of `1`) for missing keys | O(n) time · O(n) space |
| `solution_4.dart` | Prefix and suffix products moved into two plain `List<int>`s instead of maps, with an index offset to read the reversed `rights` array | O(n) time · O(n) extra space |
| `solution_5.dart` | Collapses to one array: a left-to-right pass fills the running prefix product, then a right-to-left pass multiplies the running suffix product in place | O(n) time · O(1) extra space (excluding the output array) |

The five files are a straight line from brute force to the O(1)-extra-space answer
LeetCode's follow-up asks for: `solution_2`'s string-keyed maps are a roundabout way to
store the exact same prefix/suffix ranges `solution_4` later stores in plain arrays, and
`solution_5` just reuses one of those two arrays as the output instead of allocating a
third.
