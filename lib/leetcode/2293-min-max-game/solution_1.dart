import 'dart:math';

// 1
// ms
// Beats
// 100.00%

class Solution {
  int minMaxGame(List<int> nums) {
    int len = nums.length;

    while ((len ~/= 2) > 0) {
      for (var i = 0; i < len; i++) {
        if (i.isEven) {
          nums[i] = min(nums[2 * i], nums[2 * i + 1]);
        } else {
          nums[i] = max(nums[2 * i], nums[2 * i + 1]);
        }
      }

      print(nums.sublist(0, len));
    }

    return nums[0];
  }
}
