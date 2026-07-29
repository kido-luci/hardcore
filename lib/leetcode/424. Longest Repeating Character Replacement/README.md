Runtime
—
ms
Beats
—

## Topic (LeetCode)

Hash Table · String · Sliding Window

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 7/10 | The window itself is 1004's with a different predicate — that part is a free ride. The twist is that the running maximum must be allowed to go **stale**, which looks like a bug and is the only thing standing between O(26n) and O(n) |
| ⌨️ Code | 5/10 | The final version is one loop, one array, one `max`, one `if`. Nothing nested. The whole difficulty sits in *which* counter the `max` reads |
| ⚠️ Traps | 8/10 | Every wrong version here returns plausible numbers. One of them cleared LeetCode's own sample while computing something that never looked at the string, and the analyzer was silent on the cause |
| 🎯 Worth | 8/10 | The never-shrinking window transfers to 1004, 1493 and every other "longest window with at most k violations". The stale-statistic trick is rarer and worth meeting once |

Headline `max(insight, code, traps)` = **8/10**.

## The five solutions

Every one of them is O(n) asymptotically — Σ is fixed at 26, so it vanishes into the
constant. The constant is the entire story here, which is why the timings differ by 300×.

| File | What changed | Cost |
|---|---|---|
| `solution_1.dart` | Copy the 26 counters and sort them to read off the max | 700ms |
| `solution_2.dart` | Drop the sort: ask *does any counter reach `windowLen - k`* instead of *what is the max* | ~22ms (18ms once `calWindowLen` was inlined) |
| `solution_3.dart` | Remember the counter that last cleared the threshold and try it first | ~22ms — no measurable gain, as its own comment concludes |
| `solution_4.dart` | Swap the 26-slot array for a `Map` | ~60ms — slower, and the only version not tied to A–Z |
| `solution_5.dart` | Maintain the max incrementally and never lower it; the window stops shrinking | one pass, no 26-scan |

## Step one: stop asking for the maximum

`solution_1` asks *"how many times does the most frequent character appear"*, which needs
the max, which needs a sort. But the window is only ever tested against one threshold, and

```
windowLen - max <= k    ⟺    some counter >= windowLen - k
```

The right-hand form never needs the max at all — one scan, first hit wins, no allocation.
That single reframe is the 700ms → 22ms step. Nothing else in `solution_2` changed.

`solution_1`'s header calls itself `Onlogn`. It is not: 26 is a constant, so the sort is
O(26 log 26) — a fat constant on an O(n) algorithm, not a worse complexity class. Same
species of mislabel as problem 3's `0n^2`.

`solution_3` and `solution_4` are both dead ends, and both are worth keeping. `solution_3`
adds a cached index and a branch for nothing. `solution_4` pays hashing to save nothing,
because the set it iterates is still ≤ 26 — but it is the only file here that survives an
input outside A–Z, since the others all index with `codeUnits[i] - 65`.

## Step two: let the maximum go stale

The 26-scan still runs on every check, up to ~2n times. `solution_5` removes it by noticing
that adding one character bumps exactly one counter, so the new maximum is either the old
one or that counter — an O(1) update.

The hard part is what happens on the way out. When the window shrinks, `mostAppeared` is
**not** lowered. It stays too big, and the validity test becomes permissive.

That is safe, and the reason is precise: `mostAppeared` is only ever raised on the line
directly after the increment, where the counters describe the *current* window. So every
value it holds was a real count in a real window at the moment it was set. Staleness can
make the test lenient later; it can never invent a count that never existed.

Traced on `"AABABBA"`, `k = 1`:

| i | ch | window | len | `mostAppeared` | true max |
|---|---|---|---|---|---|
| 3 | A | `AABA` | 4 | 3 | 3 |
| 4 | B | `ABAB` | 4 | 3 | **2** |
| 5 | B | `BABB` | 4 | 3 | 3 |
| 6 | A | `ABBA` | 4 | 3 | **2** |

At `i = 3` the length 4 is earned honestly: `AABA` has three `A`s and needs exactly one
replacement. At `i = 4` the window is `ABAB`, which needs *two* replacements and is not
valid at all — yet it is kept at length 4. That is fine, because 4 was already banked two
steps earlier. The stale window is a placeholder carrying a record, not a claim.

## The window never shrinks, so `while` becomes `if`

Let `D = len - mostAppeared`. Every iteration ends with `D <= k`. Next iteration `len`
grows by 1 and `mostAppeared` can only grow, so `D <= k + 1` — off by at most one. One
shrink step drops `len` by 1 and leaves `mostAppeared` untouched, so `D` falls by exactly
1 and the loop is done.

That last clause is what fails in `solution_2`: there the max is recomputed, so evicting the
character that held the record drops the max too, `D` does not move, and the loop goes
round again. Measured over 30,000 random inputs:

| | worst shrink steps in one iteration | iterations needing more than one |
|---|---|---|
| `solution_2` | 13 | 9,385 of 30,000 |
| `solution_5` | 1 | 0 |

`"AAB"` with `k = 0` is the smallest input that separates them: two steps versus one.

So the window never gets smaller — over 20,000 random runs its size never once decreased,
and `longest` always equalled the size of the final window. The algorithm is not searching
windows and keeping the best; it carries one window that can only ratchet upward, and the
answer is how big it got.

## The trap that cost the most

An intermediate version of `solution_5` shipped this line:

```dart
return e >= windowLen - k;
```

`e` was a leftover from `solution_2`, where it had been the loop variable in
`for (final e in countList)`. With the loop gone, `e` should have been undefined — except
`import 'dart:math'` is unprefixed, and `dart:math` exports `e`, Euler's number. It bound
to `2.718281828459045` and compiled clean. `dart analyze` reported one issue in the file,
and it was the naming of `start_window`.

The test became `2.718 >= windowLen - k`, i.e. *"is the window at most k+2 long"*. The
function stopped reading the string entirely and computed `min(n, k + 2)`:

| Input | Returned | Correct |
|---|---|---|
| `"ABAB"` k=2 | 4 | 4 ✅ |
| `"AABABBA"` k=1 | 3 | 4 |
| `"AAAA"` k=0 | 2 | 4 |
| `"ABCDE"` k=1 | 3 | 2 |

Wrong in both directions, and right on the sample LeetCode prints. The second slip in the
same version read the counter at `start_window` — the left edge, whose count is about to be
*decremented* — instead of the one at `i` that had just been incremented, which breaks the
very property that makes a single `max` sufficient.

The fixed version was checked against a brute force: 6 hand-picked cases plus 9,000 random
strings over three alphabet widths, 0 mismatches.

## The assumption underneath

`codeUnits[i] - 65` is only an index because the statement restricts `s` to uppercase
English letters. A single lowercase character makes it 32 and throws. `solution_4`'s map
does not care, which is the one thing it buys.

Third problem in a row where the technique is licensed by a line in the constraints rather
than by the shape of the question — after 209's positive elements and 3's printable ASCII.
