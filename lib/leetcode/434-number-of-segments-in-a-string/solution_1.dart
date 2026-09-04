// 0
// ms
// Beats
// 100.00%

class Solution {
  int countSegments(String s) {
    int count = (s.codeUnits.lastOrNull ?? 32) != 32 ? 1 : 0;

    for (var i = 1; i < s.length; i++) {
      if (s.codeUnitAt(i) == 32 && s.codeUnitAt(i - 1) != 32) count++;
    }

    return count;
  }
}
