// 12
// ms
// Beats
// 25.88%
class Solution {
  int majorityElement(List<int> nums) {
    final counts = <int, int>{};
    final mid = nums.length ~/ 2;

    for (final e in nums) {
      if (counts.update(e, (c) => c + 1, ifAbsent: () => 1) > mid) return e;
    }

    return -1;
  }
}
