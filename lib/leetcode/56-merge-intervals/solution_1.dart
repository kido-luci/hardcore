import 'dart:math';

// 24
// ms
// Beats
// 79.17%

class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    intervals.sort((a, b) => a[0].compareTo(b[0]));

    final result = <List<int>>[intervals.first];

    for (var i = 1; i < intervals.length; i++) {
      if (result.last[1] >= intervals[i][0]) {
        result.last[1] = max(result.last[1], intervals[i][1]);
      } else {
        result.add(intervals[i]);
      }
    }

    return result;
  }
}
