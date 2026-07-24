Runtime
—
ms
Beats
—

## Topic (LeetCode)

Array · Hash Table · String · Sorting

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 4/10 | You have to flip "compare every pair of strings" into "give every string a shape-preserving key and group by it" — sorting the letters (or counting them) is the standard way to build that key |
| ⌨️ Code | 3/10 | One loop, one map, one key-building step per string — `solution.dart`'s only wrinkle is Dart's `split('')..sort()..join()` dance to sort a string in place |
| ⚠️ Traps | 3/10 | Single-character and duplicate-string inputs fall out for free; the real snag is `solution_2.dart`'s `char - 97` index, which silently assumes every character is lowercase a–z |
| 🎯 Worth | 7/10 | Canonical-key grouping is the same move behind "detect duplicates up to some transformation" anywhere, not just anagrams |

Headline `max(insight, code, traps)` = **4/10**.

## Why LeetCode tags this Sorting

`solution.dart` sorts each string's characters into its key:

```
key(word) = sort(word.split(''))
```

Two strings are anagrams exactly when their sorted-character keys match, so the sort
*is* the anagram test. `solution_2.dart` reaches the same key without sorting — a fixed
26-slot letter count — trading the `O(k log k)` sort for an `O(k)` scan.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution.dart` | Canonical key = sort each string's characters alphabetically (`split('')..sort()..join()`), group by that key in a hash map | O(n·k log k) time · O(n·k) space (n strings, average length k) |
| `solution_2.dart` | Canonical key = a fixed 26-slot letter-frequency count converted to a string, skipping the sort entirely | O(n·k) time · O(n·k) space |

Dropping the sort is the only thing that changes between the two — `solution_2.dart`
still builds a string key and groups into the same kind of map, it just counts instead
of sorting to get there.
