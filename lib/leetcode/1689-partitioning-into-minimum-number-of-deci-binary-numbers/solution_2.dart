import 'dart:math';

// 9
// ms
// Beats
// 100.00%

class Solution {
  int minPartitions(String n) {
    int result = 0;

    for (final e in n.codeUnits) {
      result = max(result, e - 48);
    }

    return result;
  }
}
