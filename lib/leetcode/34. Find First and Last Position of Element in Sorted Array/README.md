Runtime
—
ms
Beats
—

## Topic (LeetCode)

Array · Binary Search

## Four-axis rating

Per `RUBRIC.md` in the private leetcode-video-toolkit repo. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 5/10 | Binary search lands on *an* index equal to `target` in O(log n), and neither end falls out of that. Seeing that each end is its own bound search — one upper, one lower — is the step beyond 35 |
| ⌨️ Code | 7/10 | Two searches with opposite comparisons, and the answer leaves them through *different* variables: `j` after the first, `i` after the second. `right` has to be captured before the second loop overwrites `j` |
| ⚠️ Traps | 8/10 | 35's boundary territory, twice over. Swap the `<=` in the first loop for `<` and it quietly becomes a lower-bound search that still returns a plausible pair on plenty of inputs; move `final right = j` one line down and the loop below eats it |
| 🎯 Worth | 8/10 | Locating both edges of a run in a sorted array shows up anywhere you need bounds, not just a single index — 35's lower-bound idea, doubled |

Headline `max(insight, code, traps)` = **8/10**.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Scan forward to the first match, then scan backward from the far end to the last | O(n) time · O(1) space |
| `solution_2.dart` | Upper-bound search for the right edge, then a lower-bound search over the range that first search narrowed to | O(log n) time · O(1) space |

## The two loops are not mirror images

They read as though they are — same `while (j >= i)`, same midpoint, one comparison
flipped. But each loop leaves its answer in a different variable:

```dart
if (nums[mid] <= target) { i = mid + 1; } else { j = mid - 1; }   // answer ends up in j
...
if (nums[mid] >= target) { j = mid - 1; } else { i = mid + 1; }   // answer ends up in i
```

Both loops end with `i == j + 1`, so both indices are always available — the choice of
which one to read is what makes each search an *upper* or a *lower* bound. Written out:

> After the first loop, `j` is the last index with `nums[j] <= target`.
>
> After the second loop, `i` is the first index with `nums[i] >= target`.

Everything else follows. `right = j` is the last occurrence, `i` from the second loop is
the first, and the pair is the answer.

Two consequences worth naming, because neither is visible from reading a single line:

- **`final right = j` has to sit above the second loop.** That loop overwrites `j` down to
  `right - 1` or lower. Moving the capture below it does not fail loudly; it returns a
  wrong right edge.
- **The second loop starts from `j = right`, not `nums.length - 1`.** That is a deliberate
  narrowing, and it is safe: the first occurrence can never sit past the last one.

## The absent-target guard

```dart
if (j < 0 || nums[j] != target) {
  return [-1, -1];
}
```

One line covering two different failures. `j < 0` is the empty array, and the case where
every element is greater than `target` — both leave the first loop with `j` at `-1`. The
`nums[j] != target` half is `target` falling in a gap between two present values. Order
matters: the short-circuit is what keeps `nums[-1]` from ever being evaluated.

## The approach this one avoids

The version most people reach for first is to binary-search onto *any* index holding
`target`, then walk outward in both directions until the run ends. It is correct, and it
degrades to O(n) the moment the array is one long run of `target` — the search costs
O(log n) and the walk costs O(k) across all k occurrences.

`solution_2` never needs to find "a" match, so there is nothing to expand from. The
guarantee is O(log n) on every input, including the all-duplicates array that is the worst
case for crawling.
