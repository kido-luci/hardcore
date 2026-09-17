import 'dart:math';

// 0
// ms
// Beats
// 100.00%

class Solution {
  int findLUSlength(String a, String b) {
    if (a == b) return -1;
    return max(a.length, b.length);
  }
}
