import 'dart:math';

// 0
// ms
// Beats
// 100.00%

class Solution {
  String winningPlayer(int x, int y) {
    return min(x, y ~/ 4).isOdd ? 'Alice' : 'Bob';
  }
}
