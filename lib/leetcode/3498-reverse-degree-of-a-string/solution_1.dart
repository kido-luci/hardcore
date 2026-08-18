// 0
// ms
// Beats
// 100.00%

class Solution {
  int reverseDegree(String s) {
    int sum = 0;

    for (var i = 0; i <= s.length - 1; i++) {
      sum += (26 - (s.codeUnitAt(i) - 97)) * (i + 1);
    }

    return sum;
  }
}
