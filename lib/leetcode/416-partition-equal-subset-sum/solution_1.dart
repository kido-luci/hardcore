import 'package:collection/collection.dart';

// 33
// ms
// Beats
// 75.00%

class Solution {
  bool canPartition(List<int> nums) {
    final total = nums.sum;
    if (total.isOdd) return false;
    final half = total ~/ 2;
    final available = List.filled(half + 1, false)..[0] = true;

    for (final e in nums) {
      for (var r = half; r >= e; r--) {
        if (available[r - e]) available[r] = true;
      }

      if (available[half]) return true;
    }

    return false;
  }
}
