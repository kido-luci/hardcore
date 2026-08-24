# Dynamic programming — where I am and what is left

Linear DP practice plan. Groups go from "no decision at all" to "the basic shape
breaks and the recurrence has to be reworked". Order matters: each group adds
exactly one new thing.

## Done (11)

| Group | Problem | |
|---|---|---|
| 1 — plain recurrence | 1025 | Divisor Game |
| | 1646 | Get Maximum in Generated Array |
| | 118 | Pascal's Triangle |
| | 119 | Pascal's Triangle II |
| | 96 | Unique Binary Search Trees |
| 2 — a choice at every step | 198 | House Robber |
| | 53 | Maximum Subarray |
| | 152 | Maximum Product Subarray |
| | 1749 | Maximum Absolute Sum of Any Subarray |
| | 1567 | Maximum Length of Subarray With Positive Product |
| 3 — parallel states | 122 | Best Time to Buy and Sell Stock II — solved greedily, the state machine is still unwritten |

## Left (9)

**Group 1 — plain recurrence**

- 264 Ugly Number II

**Group 3 — several states running in parallel.** 122 has a greedy shortcut; these
do not, so the two-state machine (`hold` / `cash`) has to be built for real.

- 714 Best Time to Buy and Sell Stock with Transaction Fee
- 309 Best Time to Buy and Sell Stock with Cooldown
- 2320 Count Number of Ways to Place Houses

**Group 4 — the basic shape breaks.** 213 and 918 take 198 and 53 and bend the
array into a circle, so the old recurrence cannot be reused as is.

- 213 House Robber II
- 918 Maximum Sum Circular Subarray
- 91 Decode Ways
- 413 Arithmetic Slices
- 1218 Longest Arithmetic Subsequence of Given Difference

## After linear DP

The ladder beyond this plan, roughly in order of how far each is from what is here:

1. **2-D / two sequences** — LCS, edit distance. The first time the table is a grid.
2. **Knapsack / subset sum** — adds a capacity dimension, and the in-place version
   depends on which direction the inner loop runs.
3. **Interval DP** — the table is filled by segment length rather than by index.
4. **Tree DP** — the recurrence runs over children instead of over `i - 1`.
5. **Bitmask DP** — a set as the state.
6. **Digit DP** — stop enumerating numbers and build them digit by digit instead.
   3751 in this repo is the version whose constraints are loose enough that plain
   enumeration passes; the sequel is where this is needed.

## Notes to self

- Fluency test for this family: reach for two or three rolling variables **first**,
  not after writing the array version.
- Rolling variables only work when the recurrence looks back a **fixed** distance.
  1646 looks back `k/2` and 96 needs every earlier value, so both keep the table.
- When the initial value is hard to choose, the state definition is probably the
  problem — see 152, where the fix was defining the state so that it always exists.
