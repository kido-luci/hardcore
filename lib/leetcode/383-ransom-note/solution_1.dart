// 1
// ms
// Beats
// 100.00%

class Solution {
  bool canConstruct(String ransomNote, String magazine) {
    final c = List.filled(26, 0);
    for (final e in magazine.codeUnits) {
      c[e - 97]++;
    }

    for (final e in ransomNote.codeUnits) {
      if (--c[e - 97] < 0) return false;
    }

    return true;
  }
}
