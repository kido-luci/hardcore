// 375
// ms
// Beats
// 100.00%

class Solution {
  int combinationSum4(List<int> nums, int target) {
    final counts = List.filled(target + 1, 0)..[0] = 1;

    for (var i = 1; i <= target; i++) {
      for (final c in nums) {
        if (i - c >= 0 && counts[i - c] >= 1) counts[i] += counts[i - c];
      }
    }

    // print(counts);

    return counts[target];
  }
}
