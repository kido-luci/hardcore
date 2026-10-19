// 0
// ms
// Beats
// 100.00%

import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    if (nums.length == 1) return nums.first;

    var take = 0;
    var pending = 0;

    for (var i = 0; i <= nums.length - 2; i++) {
      (take, pending) = (nums[i] + pending, max(take, pending));
    }

    var take2 = 0;
    var pending2 = 0;

    for (var i = 1; i <= nums.length - 1; i++) {
      (take2, pending2) = (nums[i] + pending2, max(take2, pending2));
    }

    return max(max(take, take2), max(pending, pending2));
  }
}
