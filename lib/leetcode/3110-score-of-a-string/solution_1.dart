// 1
// ms
// Beats
// 87.50%

class Solution {
  int scoreOfString(String s) {
    var sum = 0;

    final codeUnits = s.codeUnits;

    for (var i = 0; i < s.length - 1; i++) {
      sum += (codeUnits[i] - codeUnits[i + 1]).abs();
    }

    return sum;
  }
}
