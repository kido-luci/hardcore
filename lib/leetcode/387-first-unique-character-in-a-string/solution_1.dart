// 3
// ms
// Beats
// 100.00%

class Solution {
  int firstUniqChar(String s) {
    final c = List.filled(26, 0);
    for (var i = 0; i < s.length; i++) {
      c[s.codeUnitAt(i) - 97]++;
    }

    for (var i = 0; i < s.length; i++) {
      if (c[s.codeUnitAt(i) - 97] == 1) return i;
    }

    return -1;
  }
}
