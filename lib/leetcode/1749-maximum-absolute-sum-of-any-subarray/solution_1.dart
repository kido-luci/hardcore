// input         [2, -5, 1, -4, 3, -2]
// neg_sum       -2  5   4   8  5   7
// pos_sum        2 -3   1  -3  3   1
// max           2   5 	 5   8  8   8

// 2
// ms
// Beats
// 66.67%

import 'dart:math';

class Solution {
  int maxAbsoluteSum(List<int> nums) {
    int best = (nums[0]).abs();
    int neg_sum = 0;
    int pos_sum = 0;

    for (final e in nums) {
      neg_sum = max(neg_sum - e, -e);
      pos_sum = max(pos_sum + e, e);

      best = max(best, max(neg_sum, pos_sum));

      // print((neg_sum, pos_sum, best));
    }

    return best;
  }
}

void main() {
  print(Solution().maxAbsoluteSum([2, -5, 1, -4, 3, -2]));
}
