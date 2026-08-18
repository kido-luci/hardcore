import 'dart:math';

// 3
// ms
// Beats
// 100.00%

class Solution {
  int mostWordsFound(List<String> sentences) {
    int result = 0;

    for (final s in sentences) {
      result = max(result, s.split(' ').length);
    }

    return result;
  }
}
