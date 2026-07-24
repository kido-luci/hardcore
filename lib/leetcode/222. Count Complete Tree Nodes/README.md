Runtime
—
ms
Beats
—

## Topic (LeetCode)

Tree · Binary Tree · Binary Search · Bit Manipulation

## Four-axis rating

Per `tools/RUBRIC.md`. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 7/10 | Realizing a complete subtree's leftmost and rightmost heights tell you in O(log n) whether it's *perfect* — and therefore its count via `2^h − 1` — is a genuinely rare trick; nothing in the problem statement points at it |
| ⌨️ Code | 4/10 | Two while-loop height walks, a bit-shift base case, and a two-way recursive fallback — more moving parts than a plain DFS count, though none of them is individually hard |
| ⚠️ Traps | 5/10 | The shortcut only works because the input is guaranteed *complete* — feed it an arbitrary binary tree and `leftCount == rightCount` silently returns the wrong number instead of erroring |
| 🎯 Worth | 5/10 | The trick only pays off on the specific shape the problem hands you; it doesn't generalize the way a plain tree-DFS pattern does |

Headline `max(insight, code, traps)` = **7/10**.

## Why LeetCode tags this Binary Search

The recursion doesn't look like array binary search, but it plays the same
game. Walking the left spine and right spine costs O(log n) and immediately
tells you whether the current subtree is perfect. `countNodes` always
recurses into *both* children on the non-perfect path, but the completeness
invariant guarantees one of the two is always perfect — that branch bottoms
out after a single O(log n) height check, while only the other branch keeps
recursing. That's the same halve-and-continue shape as binary search, except
the O(1) index comparison is replaced by an O(log n) height comparison, at
each of O(log n) levels — hence O(log² n) instead of O(log n). The perfect
case's `(1 << leftCount) - 1` is where the Bit Manipulation tag comes from.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Walk the left spine and right spine to get their heights; if they match, the subtree is perfect and its count is `(1 << leftCount) - 1` with no further recursion; otherwise recurse into both children, where the same check resolves one side immediately | O(log² n) time — O(log n) recursive levels, each paying O(log n) for the two height walks · O(log n) space for the recursion stack |
