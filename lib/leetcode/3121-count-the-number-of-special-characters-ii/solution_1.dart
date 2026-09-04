// 388
// ms
// Beats
// 33.33%
class Solution {
  int numberOfSpecialChars(String word) {
    final count = List.filled(26, 0);
    var result = 0;

    for (final e in word.codeUnits) {
      final i = e - (e < 97 ? 65 : 97);

      switch (count[i]) {
        case 0:
          count[i] = e > 90 ? 1 : 3;
          break;
        case 1:
          if (e < 97) {
            result++;
            count[i] = 2;
          }
          break;
        case 2:
          if (e > 90) {
            result--;
            count[i] = 3;
          }
          break;
      }
    }

    return result;
  }
}
