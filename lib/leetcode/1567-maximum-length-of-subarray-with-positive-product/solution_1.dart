// [0,1,-2,-3,-4]
// 0  0  2  1. 4
// 0  1  0  3  2
//  0 1  1  3  3

import 'dart:math';

// 3
// ms
// Beats
// 100.00%

class Solution {
  int getMaxLen(List<int> nums) {
    int neg = 0, pos = 0, best = 0;

    for (final e in nums) {
      if (e > 0) {
        pos++;
        if (neg > 0) {
          neg++;
        }
      } else if (e < 0) {
        (pos, neg) = (neg > 0 ? neg + 1 : 0, pos + 1);
      } else {
        pos = neg = 0;
      }

      // print((neg, pos, best));

      best = max(best, pos);
    }

    return best;
  }
}

void main(List<String> args) {
  print(Solution().getMaxLen([0, 1, -2, -3, -4]));
}
