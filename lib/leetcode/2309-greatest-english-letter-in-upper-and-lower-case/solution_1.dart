import 'dart:math';

// 2
// ms
// Beats
// 100.00%

class Solution {
  String greatestLetter(String s) {
    final c = List.filled(26, 0);
    int g = 0;

    for (final e in s.codeUnits) {
      // print(String.fromCharCode(e));

      if (e <= g) continue;

      final i = e - (e < 97 ? 65 : 97);

      if (c[i] == 1) continue;

      if (c[i] == 0) {
        c[i] = e;
        continue;
      }

      if (e < 97 && c[i] < 97 || e > 90 && c[i] > 90) continue;

      g = max(g, e > 90 ? e - 32 : e);
      c[i] = 1;
    }

    return g == 0 ? '' : String.fromCharCode(g);
  }
}

void main(List<String> args) {
  print(
    Solution().greatestLetter(
      "nzmguNAEtJHkQaWDVSKxRCUivXpGLBcsjeobYPFwTZqrhlyOIfdM",
    ),
  );
}
