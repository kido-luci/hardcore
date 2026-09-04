// 2
// ms
// Beats
// 100.00%

class Solution {
  int numberOfSpecialChars(String word) {
    final count = List.filled(26, 0);
    var result = 0;

    for (final e in word.codeUnits) {
      final i = e - (e < 97 ? 65 : 97);

      switch (count[i]) {
        case 1:
          continue;
        case 0:
          count[i] = e;
          break;
        default:
          if (e < 97 && count[i] < 97 || e > 90 && count[i] > 90) continue;

          result++;
          count[i] = 1;
          break;
      }
    }

    return result;
  }
}
