// 5
// ms
// Beats
// 90.00%

class Solution {
  bool isAnagram(String s, String t) {
    if (s.length != t.length) return false;

    final c = List.filled(26, 0);
    for (var e in s.codeUnits) {
      c[e - 97]++;
    }

    for (var e in t.codeUnits) {
      if (--c[e - 97] < 0) return false;
    }

    return true;
  }
}
