import 'dart:math';

// 0
// ms
// Beats
// 100.00%

class Solution {
  int maximumWealth(List<List<int>> accounts) {
    var richest = 0;

    for (final e in accounts) {
      richest = max(richest, e.fold(0, (sum, e) => sum + e));
    }

    return richest;
  }
}
