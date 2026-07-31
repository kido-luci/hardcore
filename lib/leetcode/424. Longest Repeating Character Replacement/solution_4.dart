import 'dart:math';

// let try to use map to reduce the countList size
//~60ms

class Solution {
  int characterReplacement(String s, int k) {
    var start_window = 0, longest = 0;

    var codeUnits = s.codeUnits;

    final countMap = <int, int>{};

    for (var i = 0; i < codeUnits.length; i++) {
      countMap[codeUnits[i]] = (countMap[codeUnits[i]] ?? 0) + 1;

      int calWindowLen() => i - start_window + 1;

      bool isValidWindow() {
        final windowLen = calWindowLen();

        for (final e in countMap.values) {
          if (e >= windowLen - k) {
            return true;
          }
        }

        return false;
      }

      while (!isValidWindow()) {
        final count = countMap[codeUnits[start_window]]! - 1;
        count > 0
            ? countMap[codeUnits[start_window]] = count
            : countMap.remove(codeUnits[start_window]);
        start_window++;
      }

      longest = max(longest, calWindowLen());
    }

    return longest;
  }
}
