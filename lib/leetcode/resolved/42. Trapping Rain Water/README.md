Runtime
0
ms
Beats
100%

## Topic (LeetCode)

Array · Two Pointers · Dynamic Programming · Stack · Monotonic Stack

## Four-axis rating

Per `RUBRIC.md` in the private leetcode-video-toolkit repo. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 8/10 | Two steps, not one. First that water above a bar is `min(maxLeft, maxRight) - height[i]` — the statement points at containers, not at per-column heights. Then the exchange argument that licenses two pointers at all, which is `11`'s entire insight arriving here as step two |
| ⌨️ Code | 7/10 | Nested loops with an index reassignment (`left = i`) instead of the textbook single-step walk. `35`'s tier: the idea is settled long before the indices are |
| ⚠️ Traps | 8/10 | Both natural wrong versions clear example 1 — using a global max instead of `min` of the two maxes, and dropping the `i < right` guard so the inner loop walks past the other pointer |
| 🎯 Worth | 8/10 | Sits with `209`/`238`: a core pattern asked regularly, high transfer to monotonic stack and prefix-max thinking. Not `1`/`35`'s 9, which are daily-use foundations |

Headline `max(insight, code, traps)` = **8/10**.

## The wall is the pointer

The textbook two-pointer for this problem carries `leftMax` and `rightMax` and
advances one index per iteration. `solution_1` carries neither, and that is not
an omission — it is what the shape buys.

When the inner loop stops, it stops on a bar taller than everything it just
walked past. So the pointer only ever *lands* on a new maximum, and
`height[left]` already **is** `leftMax`. A separate variable would only ever
hold the same number.

That is also why the water is banked a whole run at a time rather than a column
at a time:

```dart
while (i < right && height[i] <= height[left]) {
  rain += height[left] - height[i];
  i++;
}
left = i;
```

Entering the branch means `height[left] <= height[right]`, so every bar in that
run is capped by `height[left]` — the right side is guaranteed to be at least
as tall, which makes `min(maxLeft, maxRight)` equal `height[left]` for the whole
stretch. No per-column minimum is ever computed because the branch condition
already decided it.

## The guards are the correctness argument

`i < right` and `j > left` look like ordinary bounds checks. They are the proof.

Without them the inner loop keeps consuming while `height[i] <= height[left]`,
which can carry `i` past `right` and into territory the opposite pointer has
already banked — every bar there gets counted twice. It survives example 1,
because the height test usually trips first; it takes a specific shape to
expose. That is the difference between a bug and a trap.

`left = i` — not `i + 1` — is the other half. The pointer lands *on* the tall
bar, which then becomes the wall for the next run. Skipping past it would drop
the very bar that bounds the next stretch.

## Still O(n)

Two nested loops, linear time. `left` only ever increases, `right` only ever
decreases, and they never cross, so each index is consumed by an inner loop at
most once across the entire run — the inner work is amortized, not multiplied.

Measured at the constraint ceiling: `n = 20000` alternating `0, 100000` in 40µs.
A genuine O(n²) on that input would not be close.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Two pointers walking inward. Each iteration takes the shorter side as the wall, consumes the entire run of bars it dominates while banking `wall - height[i]` for each, then jumps the pointer to the bar that stopped it | O(n) time — each index consumed at most once, amortized across both loops · O(1) space, no max variables needed |
