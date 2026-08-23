// [-2,1,-3,4,-1,2,1,-5,4]
//  -2 1 -2 4 3  5 6 -1 4

import 'dart:math';

// 1
// ms
// Beats
// 100.00%

class Solution {
  int maxSubArray(List<int> nums) {
    int max_when_i_is_right = nums[0];
    int best = max_when_i_is_right;

    for (var i = 1; i < nums.length; i++) {
      best = max(
        best,
        max_when_i_is_right = max(max_when_i_is_right + nums[i], nums[i]),
      );
    }

    return best;
  }
}
