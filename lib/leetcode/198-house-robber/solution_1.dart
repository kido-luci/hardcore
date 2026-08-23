import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    var preRod = 0;
    var rob = nums[0];

    for (var i = 1; i < nums.length; i++) {
      (rob, preRod) = (max(rob, preRod + nums[i]), rob);
    }

    return rob;
  }
}
