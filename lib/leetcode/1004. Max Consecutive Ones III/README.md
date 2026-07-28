Runtime
—
ms
Beats
—

## Topic (LeetCode)

Array · Binary Search · Sliding Window · Prefix Sum

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 5/10 | One reframing carries the whole problem: "flip at most `k` zeros" is "the longest window holding at most `k` zeros". Nothing is ever flipped. Miss it and you are searching for which zeros to pick; see it and you are back in 209 |
| ⌨️ Code | 4/10 | One loop and one counter is enough. Lighter than 209 — there is no shrink loop, because the window can only ever be one zero too wide |
| ⚠️ Traps | 5/10 | The output is hard to get subtly wrong; the **cost** is not. The naive eviction looks bounded and is quadratic, and the shape that proves it is not the shape you would test |
| 🎯 Worth | 7/10 | The standard "at most k violations" window. Same skeleton as 424, and a clean second rep after 209 — but it teaches no new state, only a new predicate |

Headline `max(insight, code, traps)` = **5/10**.

## The reframing is the problem

The statement asks which zeros to flip. That question has no cheap answer, and it is not
the question — a window containing at most `k` zeros *is* a run of ones after flipping, and
every valid answer is such a window. Once that lands, the zeros never need to be flipped,
counted afterwards, or chosen. They only need to be counted as the window moves.

This is the whole of the insight, and it is why the axis sits at 5 rather than higher:
there is a named pattern, and after 209 you already own it.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | `stacks0` holds the indices of the zeros inside the window; when there are more than `k`, `removeAt(0)` evicts the oldest and `last0Index` becomes the new boundary | O(n·k) time, quadratic at its worst · O(k) space |
| `solution_2.dart` | Same list, but nothing is ever removed — `stackIndex` is a read pointer that walks forward over it | O(n) time · O(z) space, `z` = number of zeros |

Both keep `last0Index` at the **last evicted zero**, which sits outside the window, so the
length is `i - last0Index` with no `+ 1`. Initialising it to `-1` makes the first window
come out as `i + 1` without a special case. Worth contrasting with 209's `i - j + 2`, where
the loop shrinks one step too far and the formula has to pay a compensating constant back:
here the sentinel is placed so the arithmetic explains itself.

Both files were checked against a brute force and against the canonical counter version: 9
hand-picked edge cases (empty, `k = 0`, all zeros, `k` larger than the array, both LeetCode
samples) plus 12,000 random cases across three zero densities — 0 mismatches each.

## Why `solution_1` is quadratic when it looks bounded

`removeAt(0)` shifts the whole list left, but the list never holds more than `k + 1`
entries — so each eviction costs at most `k`, not `n`. That is genuinely a bound, and it is
why the naive version does not obviously look broken.

It is also not enough. The number of evictions is `z - k` where `z` is the count of zeros,
so the total is about `(z - k) · k` — a parabola, maximised when `k` is around half the
array. Fix `n = 50,000`, make every element zero, and sweep `k`:

| k | 10 | 100 | 1,000 | 10,000 | 25,000 | 40,000 |
|---|---|---|---|---|---|---|
| `solution_1` | 1.7ms | 8.8ms | 24.5ms | 196.2ms | **309.2ms** | 198.4ms |

The cost climbs to `k = n / 2` and then comes back down. A cost that *falls* as the input
parameter grows is the signature of the product, not of either factor alone.

Sitting on that peak and doubling `n`:

| n (`k = n / 2`, all zeros) | `solution_1` | `solution_2` |
|---|---|---|
| 12,500 | 19.5ms | 0.8ms |
| 25,000 | 77.3ms | 1.2ms |
| 50,000 | 312.6ms | 0.3ms |
| 100,000 | 1,256.8ms | 0.8ms |

Four times the work for twice the input. Quadratic, at the top constraint of `n = 10⁵`.

On input that looks like the judge's — 100,000 elements, half of them zero, `k = 1,000` —
the same code runs in 25.1ms. So the `~402ms` in the file comment is a fact about the test
data, not about the algorithm: the shape that hurts is a long run of zeros with `k` near
half the length, and nothing in the suite has it.

Compare with 3, where the reasoning runs the other way: that `solution_1` reads as O(n²)
and is really O(n·Σ), held down by a constraint. Here the bound is real and still quadratic.
Neither complexity can be read off the shape of the loops.

## What `solution_2` actually changed

Nothing about the algorithm — only who moves:

```dart
// solution_1
last0Index = stacks0.removeAt(0);              // mutate the list

// solution_2
stackIndex++;                                  // move a pointer into it
last0Index = stacks0[stackIndex];
```

This is the second appearance of the same cost: 209's `solution_1` timed out on
`stacks.removeRange(0, j)`. Removing from the front of a list is O(length) both times, and
both times the fix is to stop removing and index instead.

The version that does not need the list at all is shorter than either — the window only
has to know *how many* zeros it contains, not where they are:

```dart
if (nums[r] == 0) zeros++;
while (zeros > k) { if (nums[l] == 0) zeros--; l++; }
```

O(1) space instead of O(z). `solution_2` is optimal in time and pays memory for a fact it
never uses; that gap is the thing to notice, because 424 asks for the same window with a
payload that genuinely cannot be reduced to one integer.
