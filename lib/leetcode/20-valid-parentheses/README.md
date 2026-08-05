Runtime
2
ms
Beats
95.52%

## Topic (LeetCode)

String · Stack

## Four-axis rating

Per `RUBRIC.md` in the private leetcode-video-toolkit repo. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 4/10 | `121`'s tier. Counting brackets works and keeps working right up until the types interleave — `([)]` is where it dies and where the stack arrives. The nesting in the statement points at the answer harder than `347`'s bucket sort does, so not a 5 |
| ⌨️ Code | 3/10 | One loop, one stack, one comparison. Above `26`/`27` only because there is a container to maintain rather than an index |
| ⚠️ Traps | 4/10 | Two things to forget, both real: popping without checking the stack is empty, and returning before checking it *ends* empty — `"("` reports valid. `21`'s tier: genuine, but the first bad test catches them |
| 🎯 Worth | 8/10 | To stacks what `70` is to DP — the gateway. `155`, `232`, `150`, `739` and the monotonic-stack half of `42` all start here |

Headline `max(insight, code, traps)` = **4/10**.

## One skeleton, three match tests

All three files are the same eleven lines: push the opening brackets, refuse to
pop an empty stack, and require the stack to end empty. They differ in exactly
one expression — *does this closing bracket match the one on top?*

That is the only question this problem asks, and it is worth asking three ways.

## `solution_1` — ASCII put the pairs next to each other

```dart
if ((e - openStack.removeLast()).abs() > 2) return false;
```

`()` are 40 and 41, `[]` are 91 and 93, `{}` are 123 and 125. Every pair sits
within 2 of itself. Every mismatch does not:

| | `)` 41 | `]` 93 | `}` 125 |
|---|---|---|---|
| `(` 40 | **1** | 53 | 85 |
| `[` 91 | 50 | **2** | 34 |
| `{` 123 | 82 | 30 | **2** |

Three values on the diagonal, nothing else within reach. The test is sound.

`.abs()` is load-bearing, not decoration. `{` followed by `)` gives
`41 - 123 = -82`, and `-82 > 2` is false — without the absolute value the
mismatch sails through.

### What it is actually testing

Not "do these match" but "are these near each other in ASCII". Those coincide
only because the input is guaranteed to hold nothing but the six bracket
characters.

`y` is 121 and `{` is 123, two apart. Read the loop with `"{y"`: `y` is not one
of the three openers, so it takes the closing branch, clears the distance test,
and pops the `{`. The stack ends empty and the string reports valid.

LeetCode never generates that input, so the submission is green and stays green.
It is recorded here because a test that passes for a reason unrelated to the
problem is worth knowing about — the correctness argument lives in the ASCII
table, not in the code.

## `solution_2` — the map, and where its time goes

```dart
final mapBracket = {41: 40, 125: 123, 93: 91};
```

The most readable of the three: the pairing is data, stated once, and nothing
has to be derived. It is also the slowest, and the declaration is why — `final`
inside `isValid` rebuilds the map on every call, so each invocation pays for
three hash insertions before the first character is read, then a hash lookup per
closing bracket after that.

`static const` at class level would build it once for the life of the program.
LeetCode calls the method once, so it costs nothing on the scoreboard; it is a
habit worth having anyway.

## `solution_3` — the switch

Spells out all three pairings as literal cases. No hashing, no arithmetic
trick — the compiler turns it into a jump. Between the other two on speed and,
unlike `solution_1`, it says exactly what it means.

It also fails more safely on input the constraints forbid. There is no `default`
case, so a stray character matches nothing, pops nothing, and leaves the stack
non-empty — `"{y"` returns false here. The version with the cleverest match test
is the one that mishandles it.

## The three solutions

| File | Match test | Reported |
|---|---|---|
| `solution_1.dart` | `(close - open).abs() > 2` — ASCII adjacency | 2ms · 95.52% |
| `solution_3.dart` | `switch` on the closing bracket, three literal cases | 3ms · 85.65% |
| `solution_2.dart` | `Map` lookup from closing to opening | 5ms · 54.26% |

All three are O(n) time and O(n) space on an input capped at 10⁴ characters. At
that size the spread across 2ms, 3ms and 5ms is mostly JIT warm-up and the
noise in LeetCode's own timing — the ordering is believable, the ratios are not.
What can be said without measuring is structural: `solution_1` performs
arithmetic, `solution_3` a jump, `solution_2` a hash, and the ordering follows
from that.
