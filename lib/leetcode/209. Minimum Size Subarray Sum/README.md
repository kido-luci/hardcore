Runtime
—
ms
Beats
—

## Topic (LeetCode)

Array · Binary Search · Sliding Window · Prefix Sum

## Four-axis rating

Per `RUBRIC.md` in the private leetcode-video-toolkit repo. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 5/10 | Every element is positive, so extending right only grows the sum and moving left only shrinks it — that monotonicity is what licenses two pointers at all. Recognising the named pattern is the whole step; without it you write the O(n²) double loop |
| ⌨️ Code | 7/10 | The left pointer has to live *outside* the loop, and the length formula has to agree with where you record it. 35's boundary discipline in a different costume |
| ⚠️ Traps | 7/10 | An off-by-one here still returns plausible answers on the sample cases — `target = 4, nums = [4]` is the smallest case that exposes it. Worse, `0` is both the off-by-one artefact and the legitimate "no such subarray" return, so the bug hides inside the sentinel |
| 🎯 Worth | 8/10 | The variable-size window is the base of 3, 424, 567, 1004 and 76 — one shape, five problems. Only the state carried inside the window changes |

Headline `max(insight, code, traps)` = **7/10**.

## Why LeetCode tags this Binary Search

The tags look wrong next to a two-pointer solution. They describe the **Follow up** in
the statement, not the O(n) answer:

Because every `nums[i] >= 1`, the prefix-sum array is **strictly increasing** — so for
each end index you can binary-search the furthest start that still clears `target`.
`n` searches × `log n` each.

Worth noticing that this O(n log n) is **slower** than the O(n) window. The follow-up
exists to exercise a different way of thinking, not to go faster.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Window materialised as a `List`; shrink by summing down from the front, then `removeRange` to drop the consumed prefix | O(n²) — correct, but times out |
| `solution_2.dart` | `j` (the left edge) lives outside the loop; length derived from the two indices, no list at all | O(n) time · O(1) space |

The cost in `solution_1` is not the `while` loop — elements leave `stacks` permanently, so
the shrinking is amortised O(n) like any window. It is `removeRange(0, j)` itself, which
shifts every surviving element left on each call.

Measured on `List.filled(n, 1)` with `target = n / 2` — the shape that keeps the window
long, so the shift is at its worst:

| n | `solution_1` | `solution_2` |
|---|---|---|
| 25,000 | 73ms | <1ms |
| 50,000 | 297ms | <1ms |
| 100,000 | 1196ms | <1ms |

Doubling `n` quadruples the time. Quadratic, as the comment in the file says.

Both files were checked against a brute-force reference: `solution_1` 0 mismatches over
5,000 random cases, `solution_2` 0 over 3,000.

## The `+ 2`

`solution_2` shrinks one step too far — the `while` exits only once `sum < target`, so the
last **valid** window was `[j-1, i]`, of length `i - (j-1) + 1`. Hence `i - j + 2`.

The alternative is to record the length *before* subtracting, which gives `i - j + 1` and
no compensating constant. Same complexity; the difference is only how much the formula
explains itself.

## The assumption underneath

Both solutions need every element to be **positive**. With a `0` or a negative, moving the
left edge no longer guarantees the sum falls, the window stops being monotone, and two
pointers collapse. What makes the technique legal here is the constraint `1 <= nums[i]`,
not the shape of the question.
