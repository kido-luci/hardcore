import 'dart:math' show min;

// beat: 2ms~3ms
class Solution {
  int minSubArrayLen(int target, List<int> nums) {
    int? result;

    int sum = 0;
    var j = 0;

    // On
    for (var i = 0; i < nums.length; i++) {
      sum += nums[i];

      // print((nums.sublist(j, i)));
      // print('---');

      // move j -> i until Oj+..+Oi < target
      if (sum >= target) {
        while (sum >= target) {
          sum -= nums[j];
          j++;
        }

        // on-1 - 0j; len = dif + 1 +1
        final len = i - j + 2;

        result = result == null ? len : min(result, len);
      }
    }

    return result ?? 0;
  }
}
