// 3
// ms
// Beats
// 100.00%

class Solution {
  int countValidWords(String sentence) {
    int valid = 0;

    for (final s in sentence.split(' ')) {
      if (s.isEmpty) continue;

      valid++;

      bool haveHypen = false;

      for (var i = 0; i < s.length; i++) {
        final code = s.codeUnitAt(i);

        if (code > 96 && code < 123) continue;

        switch (s[i]) {
          case ',':
          case '.':
          case '!':
            if (i == s.length - 1 && (s.length == 1 || s[i - 1] != '-')) {
              continue;
            }
            break;
          case '-':
            if (i != 0 && i != s.length - 1 && !haveHypen) {
              haveHypen = true;
              continue;
            }
            break;
        }

        valid--;
        break;
      }

      // s.codeUnits.indexWhere((e) => e < 97 || e > 122) == -1)
    }

    return valid;
  }
}
