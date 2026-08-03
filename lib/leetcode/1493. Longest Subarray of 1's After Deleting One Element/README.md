Runtime
—
ms
Beats
—

## Topic (LeetCode)

Array · Dynamic Programming · Sliding Window

## Four-axis rating

Per `RUBRIC.md` in the private leetcode-video-toolkit repo. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 4/10 | 1004 with `k` nailed to 1. The only new thought is that "delete one element" is not a step you perform — it is a `- 1` on the answer |
| ⌨️ Code | 4/10 | One loop, one counter, no nesting. Lighter than anything else in this pattern |
| ⚠️ Traps | 6/10 | The deletion is mandatory even when there is nothing to delete: `[1,1,1]` is 2, not 3. Miss it and the code is correct on every input that contains a zero — which is nearly every test you would write by hand |
| 🎯 Worth | 6/10 | A clean second rep of the at-most-k window and the cheapest place to practise the never-shrinking form. Not asked often on its own |

Headline `max(insight, code, traps)` = **6/10**.

## The `- 1` is the problem

Every solution here records `i - startWindow`, not `i - startWindow + 1`. That missing
`+ 1` is the deletion, and writing it as a permanent subtraction rather than a step is what
makes the whole thing work.

The case that punishes the alternative is an array with **no zeros at all**. One element
still has to go, so `[1,1,1]` answers 2. Code that computes "longest window containing at
most one zero" and returns its length is right on every input that contains a zero, and
wrong here — which is why the usual repair is a special case bolted on afterwards:

```dart
if (count0 == 0) return nums.length - 1;   // not needed in any file here
```

Subtracting unconditionally makes that branch disappear. `solution_1` says so in place:

```dart
longest = max(longest, i - startWindow /*(+ 1 - 1)*/);
```

`+ 1` for the window length, `- 1` for the element removed, and they cancel.

## The four solutions

| File | What changed | Cost |
|---|---|---|
| `solution_1.dart` | One counter, `while` shrinks until at most one zero remains | 2ms |
| `solution_2.dart` | Track the zero *positions* in a list; on the second zero, jump `startWindow` past the first | 4ms |
| `solution_3.dart` | Replace `removeAt(0)` with a read pointer — 1004's fix | 4ms |
| `solution_4.dart` | `while` becomes `if`; the window stops shrinking | 1ms |

## `removeAt(0)` is harmless here, and that is the interesting part

`solution_2` uses the exact construct that timed out 209 and cost 1004 402ms: removing
from the front of a list. Here it costs nothing.

The list is trimmed the moment it exceeds one entry, so it never holds more than two, and
the shift moves a single element. What made the same line quadratic in 1004 was `k` being
free to grow — the list there could reach `k + 1` entries and each eviction shifted up to
`k` of them. With `k` pinned to 1 that whole cost disappears.

Same line, different constraint, opposite verdict.

## `solution_3` goes backwards

It carries 1004's read-pointer fix across without checking whether the problem it fixes is
still here. It is not: `removeAt(0)` was already O(1), so replacing it with an index buys
nothing — both measure 4ms.

What it costs is real. `zeroIndexs` is no longer trimmed, so it grows to hold every zero in
the array: O(n) memory where `solution_2` used O(1).

Kept, and now labelled in the file. A dead end is worth walking; a dead end without a sign
on it reads as a third valid option the next time through.

## `solution_4`: the same ratchet as 424, plus one guard

`while` becomes `if`, so `startWindow` advances at most one step per iteration and the
window never shrinks — it slides at fixed width and only widens when it is allowed to.

424 records the window length unconditionally. This one cannot:

```dart
if (count0 < 2) {
  longest = max(longest, i - startWindow);
}
```

The difference is what goes stale. In 424 it is a *statistic* — `mostAppeared` is too large,
which only makes the test lenient, while the window itself still has a width that was
earned honestly. Here the window genuinely contains two or more zeros while it slides, so
there are stretches where it is not an answer at all, and the guard names them.

The guard is also arguably redundant: `startWindow` only advances while `count0 > 1`, which
is exactly when `i` advances too, so the width is frozen during those stretches and an
unguarded record would re-report a number already banked. Reasoning, not measurement — the
files carry LeetCode timings, so nothing here was re-run locally. It earns its place as
documentation either way.

## Where it sits

| | Window state | Shrinking |
|---|---|---|
| 1004 | count of zeros, `k` free | steps, possibly several |
| **1493** | count of zeros, `k = 1` | one step, or none |
| 424 | count of every character | one step, with a stale maximum |

The cheapest place in the family to see the never-shrinking window on its own: the statistic
here is exact, never stale, so the ratchet is the only new idea in the file.
