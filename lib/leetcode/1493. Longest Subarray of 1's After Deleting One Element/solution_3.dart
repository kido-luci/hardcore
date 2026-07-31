import 'dart:math';

// read pointer instead of removeAt(0) - the 1004 fix
// but k=1 caps the list at 2, so removeAt(0) already shifts 1 element
// => no gain, and zeroIndexs is never trimmed now: On memory vs O1
// 4ms
class Solution {
  int longestSubarray(List<int> nums) {
    var startWindow = 0;
    var longest = 0;
    final zeroIndexs = <int>[];
    var zeroIndex = 0;

    // loop: 0 -> n-1
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] == 0) zeroIndexs.add(i);

      if (zeroIndexs.length - zeroIndex > 1) {
        startWindow = zeroIndexs[zeroIndex] + 1;
        zeroIndex++;
      }

      longest = max(longest, i - startWindow);
    }

    return longest;
  }
}
