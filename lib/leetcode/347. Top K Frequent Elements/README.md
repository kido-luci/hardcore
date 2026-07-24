Runtime
—
ms
Beats
—

## Topic (LeetCode)

Array · Hash Table · Heap · Bucket Sort

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 5/10 | Frequency is bounded by `nums.length`, so you can skip comparison-based sorting (or a heap) entirely and bucket values by their count — that reframing is the whole problem |
| ⌨️ Code | 3/10 | Two hash maps and a loop: count, flip counts into frequency buckets, then walk the buckets top-down — nothing structurally hard once the counting-map idea is there |
| ⚠️ Traps | 3/10 | The bucket walk's loop bound is the one to get exactly right — `solution_2.dart` starts at `nums.length` (not `nums.length - 1`) because every element could be the same value |
| 🎯 Worth | 8/10 | "Count then rank" is one of the most commonly asked hash-map compositions there is |

Headline `max(insight, code, traps)` = **5/10**.

## Why LeetCode tags this Heap

Neither solution here uses one. The textbook approach keeps a size-`k` min-heap while
scanning the counts, giving `O(n log k)`. `solution_2.dart` skips the heap: a frequency
can never exceed `nums.length`, so every value can be bucketed by its count
(`countSwap[count] = [values...]`) and read back by walking buckets from `nums.length`
down to `1` — `O(n)`. A heap only earns its keep when the range of possible keys isn't
bounded like this.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Count frequencies in a map, sort all entries by count descending, take the first `k` | O(n log n) time (sorting the entries dominates) · O(n) space |
| `solution_2.dart` | Count frequencies, then bucket sort: `countSwap[count]` holds every value with that frequency; walk frequencies from `nums.length` down to `1`, collecting values until `k` are gathered | O(n) time · O(n) space |

`countSwap` is the count map turned inside out — frequency becomes the key, values
become the bucket. Reading it top-down replaces the sort in `solution_1.dart` with a
single linear pass.
