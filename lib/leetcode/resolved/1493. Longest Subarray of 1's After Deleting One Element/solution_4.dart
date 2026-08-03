import 'dart:math';

// 1ms
class Solution {
  int longestSubarray(List<int> nums) {
    var startWindow = 0;
    var longest = 0;
    var count0 = 0;

    // loop: 0 -> n-1
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] == 0) count0++;

      // window = [startWindow … i]

      // invalidWindowCheck: window contains “0” > 1

      if (count0 > 1) {
        if (nums[startWindow] == 0) {
          count0--;
        }

        startWindow++;
      }

      if (count0 < 2) {
        //         longest = max(longest, window len. - 1)
        longest = max(longest, i - startWindow /*(+ 1 - 1)*/);
      }
    }

    return longest;
  }
}
