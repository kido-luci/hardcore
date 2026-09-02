// 0
// ms
// Beats
// 100.00%

class Solution {
  void reverseString(List<String> s) {
    final mid = s.length ~/ 2;

    for (var i = 0; i < mid; i++) {
      final tmp = s[i];
      s[i] = s[s.length - 1 - i];
      s[s.length - 1 - i] = tmp;
    }
  }
}
