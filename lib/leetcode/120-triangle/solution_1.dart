import 'dart:math';

import 'package:collection/collection.dart';

// 41
// ms
// Beats
// -%
class Solution {
  int minimumTotal(List<List<int>> triangle) {
    for (var i = 1; i < triangle.length; i++) {
      for (var j = 0; j <= i; j++) {
        if (j == 0) {
          triangle[i][j] += triangle[i - 1][j];
        } else if (j == i) {
          triangle[i][j] += triangle[i - 1][j - 1];
        } else {
          triangle[i][j] += min(triangle[i - 1][j], triangle[i - 1][j - 1]);
        }
      }
    }

    return triangle.last.min;
  }
}
