import 'dart:math';

// 0
// ms
// Beats
// 100.00%

class Solution {
  List<int> constructRectangle(int area) {
    final mid = sqrt(area).toInt();

    for (var j = mid; j > 1; j--) {
      if (area % j == 0) return [area ~/ j, j];
    }

    return [area, 1];
  }
}
