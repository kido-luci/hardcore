// 8
// ms
// Beats
// 100.00%

class Solution {
  int countCharacters(List<String> words, String chars) {
    final chars_count = List.filled(26, 0);
    for (final e in chars.codeUnits) {
      chars_count[e - 97]++;
    }

    int result = 0;

    for (final word in words) {
      final word_count = List.filled(26, 0);

      result += word.length;

      for (final e in word.codeUnits) {
        word_count[e - 97]++;
      }

      for (var i = 0; i < 26; i++) {
        if (chars_count[i] < word_count[i]) {
          result -= word.length;
          break;
        }
      }
    }

    return result;
  }
}
