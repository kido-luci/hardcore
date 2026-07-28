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
| 💡 Insight | 6/10 | Naming the pattern is not enough. In 209 and 1004 the left edge *steps* until a scalar becomes legal; here it has to **jump** past the previous occurrence, which means remembering where every character was, not how many of something the window holds |
| ⌨️ Code | 6/10 | One pass, one array, no nesting — lighter than 209. The weight is in keeping the stored indices honest as the left edge advances; get that wrong and nothing downstream saves you |
| ⚠️ Traps | 8/10 | The natural wrong version passes **all three samples the statement prints** and is still wrong on 60% of random 4-letter strings. `"abba"` is the shortest case that exposes it |
| 🎯 Worth | 9/10 | The first window that carries per-element state — 424, 567 and 76 are the same shape with a different payload. 209's README pointed here for a reason |

Headline `max(insight, code, traps)` = **8/10**.

## Where this sits above 209 and 1004

All three are labelled Medium, which flattens the one difference that matters — what the
window has to remember:

| | Window state | Shrinking the left edge |
|---|---|---|
| 209 | one running `sum` | step until the sum is legal |
| 1004 | count of zeros | step past exactly one zero |
| **3** | the position of **every** distinct character | **jump** past the duplicate |

A scalar can be repaired one step at a time, so the left edge never needs to know where it
is going. A position cannot — you have to know *where* to land, and that is the problem.

## The trap: an index that has already left the window

The version almost everyone writes first jumps the left edge straight to `lastSeen + 1`:

```dart
if (seen.containsKey(c)) {
  left = seen[c]! + 1;   // no max(left, ...)
}
```

On `"abba"` the left edge reaches 2 after the second `b`, then the final `a` finds
`seen['a'] = 0` and drags it **backwards** to 1 — a window that stopped existing two steps
ago. It returns 3; the answer is 2.

The bug is ordinary. The failure profile is what makes it expensive:

| Input | Wrong version | Correct |
|---|---|---|
| `"abcabcbb"` *(sample 1)* | 3 | 3 ✅ |
| `"bbbbb"` *(sample 2)* | 1 | 1 ✅ |
| `"pwwkew"` *(sample 3)* | 3 | 3 ✅ |
| `"abba"` | 3 | 2 ❌ |
| `"abcba"` | 4 | 3 ❌ |
| `"tmmzuxt"` | 6 | 5 ❌ |

It clears every example the statement shows you, then misses 3,001 of 5,000 random
4-letter strings. Reading your own code will not find this. Running it against a brute
force will, immediately.

`solution_2` is never offered the chance to go backwards. As the left edge advances it
wipes the entries it passes:

```dart
while (lastBreak <= charIndex[char[i]]) {
  charIndex[char[lastBreak]] = -1;
  lastBreak++;
}
```

which buys the invariant the whole solution rests on:

> `charIndex` only ever holds indices `>= lastBreak`.

A stale index cannot be read because it is no longer there to read. Worth saying out loud,
because the loop is doing something unusual: it reads `charIndex[char[i]]` in its own
condition while overwriting that same cell, and it terminates *because* the cell flips to
`-1` on the step that reaches it.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | For each `i`, walk backwards while the characters are new; the walk stops at the first repeat, so `i - j` is exactly the window ending at `i` | O(n·Σ) time · O(Σ) space |
| `solution_2.dart` | One pass; `lastBreak` is the left edge, `charIndex` remembers where each character was last seen and is cleared as the edge moves over it | O(n) time · O(1) space (a fixed 127-slot array) |

`solution_1` starts its walk at `j = i` and reports `i - j`, so a window that runs to the
front of the string leaves `j = -1` and the length comes out as `i + 1` with no special
case. The sentinel sits outside the window and the arithmetic follows — the same trick
reappears as `last0Index = -1` in 1004.

Both files were checked against a brute-force reference: 15 hand-picked edge cases plus
20,000 random strings across five alphabet widths (2, 3, 8, 26, 95) — 0 mismatches each.

## `solution_1` is not O(n²)

The file comment says `0n^2`, which is the natural reading of a loop inside a loop. But the
inner walk stops at the first repeated character, so it can never run longer than the
number of **distinct** characters in play. Under this problem's constraint that is 95
printable ASCII characters, however long `s` gets.

Hold the alphabet at 95 and grow `n`:

| n | `solution_1` | `solution_2` |
|---|---|---|
| 10,000 | 30.5ms | <0.1ms |
| 25,000 | 76.1ms | 0.1ms |
| 50,000 | 152.8ms | 0.1ms |

Doubling `n` doubles the time. Linear.

Now hold `n` at 50,000 and widen the alphabet instead:

| Σ | 2 | 26 | 95 | 500 | 5,000 |
|---|---|---|---|---|---|
| `solution_1` | 6.7ms | 44.1ms | 153.5ms | 685.3ms | 8,768.7ms |

There is the quadratic term. The honest complexity is **O(n·Σ)**, and the 240ms submission
is not luck — the alphabet constraint is doing the work.

Compare with 1004, where the same reasoning runs the other way: that `solution_1` looks
bounded and is genuinely quadratic.

## The assumption underneath

`solution_2` indexes `List.filled(127, -1)` with a raw code unit. That is legal here and
nowhere else:

- ASCII is **0…127** — 128 values — so a 127-slot array is one short of the range it is
  named after.
- It survives because 127 is `DEL`, a control character, and the statement admits only
  English letters, digits, symbols and spaces. The real ceiling is `~` = **126**.

Anything outside that throws rather than answering wrongly, which is the good failure:
`"école"` → `RangeError: Not in inclusive range 0..126: 233`. `solution_1` uses a `Map` and
does not care.

Same shape of dependency as 209 needing every element to be positive: what makes the
technique legal is a line in the constraints, not the structure of the question.
