Runtime
—
ms
Beats
—

## Topic (LeetCode)

Two Pointers · String

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 2/10 | Two pointers closing in from both ends while skipping non-alphanumerics is the first thing anyone tries here |
| ⌨️ Code | 3/10 | One loop plus a char-classification helper, but each side needs its own skip step tracked with a bit of state across iterations |
| ⚠️ Traps | 4/10 | The skip logic runs independently per side, single character at a time — write it as a nested "skip while invalid" loop instead and a pointer can sail past its partner on a string that's all punctuation on one end |
| 🎯 Worth | 5/10 | A standard two-pointer warm-up on strings — a useful filtering template, but the pattern itself doesn't generalize much further |

Headline `max(insight, code, traps)` = **4/10**.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Two pointers over `codeUnits`; `checkCode` normalizes digits/letters to lowercase and returns `null` for anything else, and each side re-enters the loop via `continue` until it lands on a valid character to compare | O(n) time · O(1) extra space |

`codeUnits` reads UTF-16 units, not Unicode runes — harmless here since only ASCII
alphanumerics are ever compared, but it means this helper would need `runes`
instead before reusing it on text with characters outside the BMP.
