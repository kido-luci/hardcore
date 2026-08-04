Runtime
56
ms
Beats
59%

## Topic (LeetCode)

Array · Two Pointers · Sorting

## Four-axis rating

Per `RUBRIC.md` in the private leetcode-video-toolkit repo. This series' own scale, not LeetCode's.

| Axis | Score | Reason |
|---|---|---|
| 💡 Insight | 6/10 | With `167` already solved, the reduction — sort, fix `i`, run the sorted two-pointer against `-nums[i]` — is one step rather than a discovery. What is not free is picking sorting as the *deduplication* mechanism instead of post-filtering canonical triplets through a `Set`. Peer of `11` and `3` |
| ⌨️ Code | 7/10 | `35`/`34`/`209`'s tier. Three separate skip sites, each reading `nums[left + 1]` or `nums[right - 1]` behind a guard that has to be exactly right, and the outer one mutates the `for` variable from inside the body. Below `76` — fewer interacting parts, but more places to put an index wrong |
| ⚠️ Traps | 8/10 | `3`'s tier. Deduplicate `i` alone and **all three LeetCode samples pass**; `[-2, 0, 0, 2, 2]` is where it breaks. Skip a run and then step again, or step without skipping, and triplets vanish silently instead of duplicating loudly |
| 🎯 Worth | 9/10 | With `1` and `3`. Asked constantly, and it is the reduction the whole k-Sum family is built on — `16`, `18` and `259` are this problem with the comparison changed |

Headline `max(insight, code, traps)` = **8/10**.

## Sorting is the deduplication, not an optimisation

The statement bans duplicate triplets, and that constraint — not the search — is
what the solution is shaped around. There are two ways to honour it:

- find every triplet, canonicalise each one, push them all through a `Set`
- sort first, and never generate a duplicate in the first place

The second pays `O(n log n)` once and nothing after. The first pays a hash of a
three-element list on every hit, forever. Sorting is also what licenses the
converging two-pointer at all, so the single `nums.sort()` on line 27 buys both
things at once.

That is why line 13's note — *"the order doesn't matter, so sort is faster and
simpler than using hashmap"* — is the load-bearing sentence of the file.

## One rule, two meanings

Five `while` loops do the same thing: advance a pointer past a run of equal
values. The rule they implement, stated once at lines 16–21:

> a pointer that moves skips the whole run of equal values, so the same
> `(left, right)` **value** pair is never evaluated twice

It is safe because equal values give an equal sum. Nothing can be jumped over —
every element skipped would have produced the sum just computed.

That same fact is why the rule earns its place differently at each site:

| Site | Line | Required? | Why |
|---|---|---|---|
| `nums[i]` | 82 | **yes** | two equal `i` regenerate an identical triplet set |
| `left`, `sum == 0` | 48 | **yes** | the next equal pair re-adds an identical triplet |
| `right`, `sum == 0` | 53 | **yes** | same |
| `right`, `sum > 0` | 64 | no | speed only — nothing is recorded in this branch |
| `left`, `sum < 0` | 72 | no | speed only — same |

Three are correctness, two are not, and the difference is invisible in the code:
the loops are character-for-character identical. Concretely, on
`[-2, 0, 0, 2, 2]` with `i = 0`, after recording `[-2, 0, 2]` a plain
`left++; right--;` lands on the *other* `0` and the *other* `2` — same sum, same
triplet, recorded twice. In the `sum > 0` branch the identical situation costs
nothing, because there is no `result.add` to protect.

## The two optional skips are a trade, not a free win

Array reads for a run of `k` equal values on the `right` side:

| | reads |
|---|---|
| with the skip loop | `2k + 3` |
| without it | `3k` |

Even at `k = 3`. Above that the skip wins, and wins more the longer the run. At
`k = 1` — no run at all, the ordinary case for values drawn from
`[-10^5, 10^5]` — it spends 2 reads per pointer move to discover there is
nothing to skip, across `O(n²)` pointer moves.

So the two optional loops help on duplicate-heavy inputs and cost a little on
distinct ones. Kept as written, and noted here rather than quietly changed.

## What is not here

Beats `59%` is left on the table by one missing line. After sorting, once
`nums[i] > 0` every remaining element is positive and no triplet can reach zero;
`break` there and the outer loop stops instead of sweeping the entire positive
tail. Line 30 catches only the case where the *whole* array is positive, which
is not the shape of a 3000-element test.

Three in-loop early exits were also weighed:

| Guard | Verdict |
|---|---|
| `nums[left] > -nums[i]` in the `sum > 0` branch | **valid.** `nums[left]` is the smallest value remaining and `left` only rises, so every remaining pair overshoots. It subsumes the `nums[i] > 0` break above, firing on the first inner iteration of every positive `i` |
| `nums[right] < nums[i]` in the `sum < 0` branch | dead. Sorted ascending with `right > i` makes `nums[right] >= nums[i]` permanently true |
| `nums[right] < -nums[i]`, the symmetric-looking repair of it | **wrong.** On `[-10, 0, 1, 9]` it fires at `left = 1` and loses `[-10, 1, 9]`, which sits at `left = 2` |

The asymmetry is the interesting part. Bounding by `nums[left]` works because
both pointers move away from small values; `right` falling does not stop `left`
from rising to meet it, so the right side needs the two largest remaining —
`nums[right] + nums[right - 1] < -nums[i]` — to bound anything at all.

None of this is applied. Solutions here are the author's, and a review reports
rather than repairs.

## Where it sits

| | What is fixed | What the two pointers search for |
|---|---|---|
| 167 | nothing | a pair meeting `target` |
| 11 | nothing | the largest width × shorter-side product |
| **15** | **one element per outer step** | **a pair meeting `-nums[i]`** |

`15` is `167` run `n` times with a fresh target each time, wrapped in the
deduplication `167` never needs — it returns one answer and stops. `26` supplies
the other half: the skip-past-a-run idiom, used here to avoid emitting rather
than to compact in place.

## The solutions

| File | Approach | Complexity |
|---|---|---|
| `solution_1.dart` | Sort, then for each `i` run a converging two-pointer over `i+1 .. n-1` looking for `-nums[i]`, skipping past runs of equal values at every pointer move so no value pair is evaluated twice | O(n²) time — the `O(n log n)` sort disappears into it · O(1) extra space beyond the output, since the sort is in place |
