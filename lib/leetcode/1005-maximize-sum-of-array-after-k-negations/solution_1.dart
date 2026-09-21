import 'dart:math';

// 9
// ms
// Beats
// 100.00%

class Solution {
  int largestSumAfterKNegations(List<int> nums, int k) {
    nums.sort();

    int sum = 0;
    int smallest = nums[0].abs();

    for (final e in nums) {
      smallest = min(smallest, e.abs());

      if (e < 0) {
        if (k > 0) {
          k--;
          sum -= e;
        } else {
          sum += e;
        }
      } else {
        sum += e;
      }
    }

    if (k.isOdd) sum -= smallest * 2;

    return sum;
  }
}

void main(List<String> args) {
  print(Solution().largestSumAfterKNegations([5, 6, 9, -3, 3], 2));
}
