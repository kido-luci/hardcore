// 0
// ms
// Beats
// 100.00%

import 'dart:math';

class Solution {
  int maximumDifference(List<int> nums) {
    int best = -1;

    int smallest = nums[0];

    for (var i = 1; i < nums.length; i++) {
      if (nums[i] < smallest) {
        smallest = nums[i];
      } else if (nums[i] > smallest) {
        best = max(best, nums[i] - smallest);
      }
    }

    return best;
  }
}
