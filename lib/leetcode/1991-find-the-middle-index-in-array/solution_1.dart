import 'package:collection/collection.dart';

// 20
// ms
// Beats
// 25.00%
class Solution {
  int findMiddleIndex(List<int> nums) {
    final len = nums.length;

    var sum = nums.sum;

    int left = 0;

    for (var i = 0; i < len; i++) {
      final num = nums[i];

      if (left == sum - num) return i;

      left += num;
      sum -= num;
    }

    return -1;
  }
}
