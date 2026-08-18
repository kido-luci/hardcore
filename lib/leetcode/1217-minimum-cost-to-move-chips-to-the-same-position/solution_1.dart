import 'dart:math';

// 0
// ms
// Beats
// 100.00%

class Solution {
  int minCostToMoveChips(List<int> position) {
    int odd = 0;
    int even = 0;

    for (final e in position) {
      if (e.isEven) {
        even++;
      } else {
        odd++;
      }
    }

    return min(odd, even);
  }
}
