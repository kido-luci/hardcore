// 4
// ms
// Beats
// 100.00%

class Solution {
  int maxDistinct(String s) {
    final appeares = List.filled(26, false);

    int count = 0;

    for (var i = 0; i < s.length; i++) {
      if (!appeares[s.codeUnits[i] - 97]) {
        appeares[s.codeUnits[i] - 97] = true;
        count++;
      }
    }

    return count;
  }
}
