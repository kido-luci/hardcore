// 1
// ms
// Beats
// 88.89%

class Solution {
  String findTheDifference(String s, String t) {
    if (s.isEmpty) return t;

    int codeUnit = s.codeUnitAt(0);

    for (var i = 1; i < s.length; i++) {
      codeUnit ^= s.codeUnitAt(i);
    }

    for (final e in t.codeUnits) {
      codeUnit ^= e;
    }

    return String.fromCharCode(codeUnit);
  }
}
