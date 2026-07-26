import 'dart:math' show min;

// Timeout: stacks.removeRange = On^2
class Solution {
  int minSubArrayLen(int target, List<int> nums) {
    int? result;

    final List<int> stacks = [];
    int sum = 0;

    for (var i = 0; i < nums.length; i++) {
      sum += nums[i];
      stacks.add(nums[i]);

      // print((stacks, sum));

      if (sum >= target) {
        var j = 0;

        // print(stacks);

        while (sum >= target) {
          // print(sum);

          sum -= stacks[j];
          j++;
        }

        stacks.removeRange(0, j);

        // print(stacks);

        result = result == null
            ? stacks.length + 1
            : min(result, stacks.length + 1);

        // print(result);

        // print('---');
      }
    }

    return result ?? 0;
  }
}
