// 20
// ms
// Beats
// 97.03%

class Solution {
  bool containsDuplicate(List<int> nums) {
    final set = <int>{};

    for (final e in nums) {
      if (!set.add(e)) return true;
    }

    return false;
  }
}
