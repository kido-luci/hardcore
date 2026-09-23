import 'dart:math';

// 2
// ms
// Beats
// 66.67%

class Solution {
  bool canJump(List<int> nums) {
    int remain = nums[0];
    var i = 0;
    final end = nums.length - 1;
    while (remain > 0 && i + remain < end) {
      remain = max(remain - 1, nums[++i]);
    }

    return i + remain >= end;
  }
}

void main(List<String> args) {
  print(Solution().canJump([2, 3, 1, 1, 4]));
}
