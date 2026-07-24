Runtime
—
ms
Beats
—

## Topic (LeetCode)

Array · Two Pointers · Greedy

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 6/10 | Seeing that you can discard the shorter line's side without checking any pair that keeps it needs a real exchange argument, not just intuition |
| ⌨️ Code | 2/10 | Two pointers, one comparison, one running max — barely more than the nested loop it replaces |
| ⚠️ Traps | 4/10 | Swap which side moves on a tie (or move the taller line instead) and it still returns a plausible number on most inputs — just not the maximum one |
| 🎯 Worth | 7/10 | The "discard the shorter side" elimination argument is a two-pointer archetype that recurs anywhere a sorted or bounded structure lets you rule out a whole side at once |

Headline `max(insight, code, traps)` = **6/10**.

## Why LeetCode tags this Greedy

Every step makes an irrevocable choice — move the shorter line inward — and never
reconsiders it. That's only safe because pairing the shorter line with anything
closer in can only shrink both the width and the height cap, so no configuration
that keeps the shorter line where it is can beat the best area already recorded.
That locally-optimal, never-revisited structure is what makes this Greedy rather
than a plain sliding window.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Two pointers from both ends; at each step record `min(height) * width`, then move the shorter side inward | O(n) time · O(1) space |
