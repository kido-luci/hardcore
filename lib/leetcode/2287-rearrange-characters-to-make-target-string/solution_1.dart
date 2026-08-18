import 'dart:math';

// 4
// ms
// Beats
// 100.00%

class Solution {
  int rearrangeCharacters(String s, String target) {
    final sCount = List.filled(26, 0);
    final tCount = List.filled(26, 0);

    for (final e in s.codeUnits) {
      sCount[e - 97]++;
    }

    for (final e in target.codeUnits) {
      tCount[e - 97]++;
    }

    int? result;

    for (var i = 0; i < 26; i++) {
      if (tCount[i] != 0) {
        // print((sCount[i], tCount[i], sCount[i] ~/ tCount[i]));

        final available = sCount[i] ~/ tCount[i];

        result = result == null ? available : min(available, result);
      }
    }

    return result ?? 0;
  }
}
