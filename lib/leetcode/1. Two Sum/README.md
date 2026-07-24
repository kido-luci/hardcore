Runtime
—
ms
Beats
—

## Topic (LeetCode)

Array · Hash Table

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 4/10 | The reframe is "does `target - x` already exist" instead of "check every pair" — small once seen, easy to miss cold |
| ⌨️ Code | 2/10 | One loop, one map, one lookup before one insert — almost nothing to misplace |
| ⚠️ Traps | 3/10 | Checking the map for the complement *before* writing the current value in is the whole trick — reverse the order and duplicates silently pair an element with itself |
| 🎯 Worth | 9/10 | The most-asked problem there is; map-as-lookup is everywhere |

Headline `max(insight, code, traps)` = **4/10**.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution.dart` | Brute force: check every `(i, j)` pair for `nums[i] + nums[j] == target` | O(n²) time · O(1) extra space |
| `solution_2.dart` | Hash map built while scanning; a same-value pair (`nums[i] * 2 == target`) is caught inline, then a second pass over the map's entries finds any remaining complement pair | O(n) time (two linear passes) · O(n) space |
| `solution_3.dart` | Classic one-pass hash map: look up `target - nums[i]` before inserting `nums[i]` | O(n) time · O(n) space |

`solution_2` is really `solution_3`'s idea half-discovered — it already stores a value-to-index map, but it only special-cases the self-pairing duplicate during the build and falls back to a full second sweep for everything else. `solution_3` drops the special case entirely and gets the same guarantee for free by checking the complement before every insert.
