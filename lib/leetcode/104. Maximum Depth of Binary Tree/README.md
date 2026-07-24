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
| 💡 Insight | 1/10 | The recursion is the definition of depth read back verbatim — 1 plus the deeper of the two subtrees |
| ⌨️ Code | 1/10 | One base case, one recursive call, one `max` — nothing to structure |
| ⚠️ Traps | 2/10 | Only the null-root base case to remember; there's no boundary math to get backwards |
| 🎯 Worth | 6/10 | It's the base recursion every later tree problem in this series extends, but on its own it's a warm-up, not a pattern you'd reach for deliberately |

Headline `max(insight, code, traps)` = **2/10**.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution.dart` | Textbook recursion: null returns 0, otherwise `1 + max(depth(left), depth(right))` | O(n) time — visits every node once · O(h) space for the call stack (h = tree height; O(log n) balanced, O(n) worst-case skewed) |
