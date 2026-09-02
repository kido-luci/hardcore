// 0
// ms
// Beats
// 100.00%

class Solution {
  String repeatedCharacter(String s) {
    final c = List.filled(26, 0);
    for (var i = 0; i < s.length; i++) {
      if (++c[s.codeUnitAt(i) - 97] == 2) return s[i];
    }

    return '';
  }
}
