import 'dart:math';

//    [-2, 3 ,-4,  0 ,  2  , -2, -100, 100]
//neg  -2 -6 -12   #    #    -4  -100 -10000
//pos   # 3  24    #   2     #    400 40000
//max  -2 3  24   24   24    24  400  40000

// 3
// ms
// Beats
// 94.44%

class Solution {
  int maxProduct(List<int> nums) {
    int? neg;
    int? pos;
    int best = nums[0];

    for (final e in nums) {
      if (e > 0) {
        pos = pos == null ? e : pos * e;
        if (neg != null) neg *= e;
      } else if (e < 0) {
        (pos, neg) = (neg != null ? neg * e : null, pos != null ? pos * e : e);
      } else {
        neg = pos = null;
      }

      best = max(best, pos ?? neg ?? 0);

      // print((neg, pos, best));
    }

    return best;
  }
}

void main() {
  print(Solution().maxProduct([-2, 3, -4, 0, 2, -2, -100, 100]));
}
