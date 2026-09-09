// 2
// ms
// Beats
// 80.00%

class Solution {
  bool findSubarrays(List<int> nums) {
    final set = <int>{};

    for (var i = 1; i < nums.length; i++) {
      if (!set.add(nums[i] + nums[i - 1])) return true;
    }

    return false;
  }
}
