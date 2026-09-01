// 38
// ms
// Beats
// 96.43%

class Solution {
  bool containsNearbyDuplicate(List<int> nums, int k) {
    if (k == 0) return false;

    final set = <int>{};

    for (var i = 0; i <= k && i < nums.length; i++) {
      if (!set.add(nums[i])) return true;
    }

    // print(set);

    for (var i = k + 1; i < nums.length; i++) {
      set.remove(nums[i - k - 1]);
      // print(set);

      if (!set.add(nums[i])) return true;

      // print(set);
    }

    return false;
  }
}
