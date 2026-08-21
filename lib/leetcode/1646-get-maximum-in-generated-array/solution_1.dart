import 'dart:math';

// 2
// ms
// Beats
// -%
//
class Solution {
  int getMaximumGenerated(int n) {
    if (n <= 1) return n;

    final list = <int>[0, 1];

    var result = 1;

    for (var i = 2; i <= n; i++) {
      final newVal = i.isEven ? list[i ~/ 2] : list[i ~/ 2] + list[i ~/ 2 + 1];
      list.add(newVal);
      result = max(result, newVal);
    }

    return result;
  }
}
