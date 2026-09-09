import 'dart:math';

// 0
// ms
// Beats
// 100.00%

class Solution {
  int maxDistance(List<int> colors) {
    int fromLeft = 0;

    for (var i = 0; i < colors.length - 1; i++) {
      if (colors[i] != colors.last) {
        fromLeft = colors.length - 1 - i;
        break;
      }
    }

    int fromRight = 0;

    for (var j = colors.length - 1; j > 0; j--) {
      if (colors[j] != colors.first) {
        fromRight = j;
        break;
      }
    }

    return max(fromLeft, fromRight);
  }
}
