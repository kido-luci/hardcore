Runtime
—
ms
Beats
—

## Topic (LeetCode)

Tree · Depth-First Search · Binary Tree

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 5/10 | The two-function version is the natural first idea, and it's wrong-shaped, not wrong — spotting that height and balance can come back from the same call needs recognizing the "encode failure in the return value" pattern |
| ⌨️ Code | 3/10 | The recursive `calHeight` needs exactly one added idea over the naive version — short-circuit on `-1` — and two checks to propagate it up through both children; nothing else changes shape |
| ⚠️ Traps | 5/10 | `solution.dart`'s O(n²) recompute still returns every correct answer LeetCode checks for — nothing about the test set forces you to notice the wasted work |
| 🎯 Worth | 6/10 | The one-pass, sentinel-return trick is reusable for any tree walk that needs a value and a validity check at once, though it's less universally reached-for than a plain DFS |

Headline `max(insight, code, traps)` = **5/10**.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution.dart` | Top-down: at every node, independently run `calHeight` on the left and right subtree to check the balance condition, then recurse `isBalanced` into both children — which recomputes height on their subtrees all over again | O(n²) worst case (skewed tree) — each of the n nodes triggers an O(subtree size) height scan · O(h) space |
| `solution_2.dart` | Bottom-up: `calHeight` returns the real height, or short-circuits to `-1` the instant an imbalance turns up anywhere below, so height and balance fall out of one pass instead of two | O(n) time — each node visited once · O(h) space |

`solution_2.dart` keeps the original top-down body commented out above the
rewrite rather than deleting it, so the diff between "compute height twice"
and "compute it once with a sentinel" stays visible in the file itself.
