import 'dart:math';

// our trap is 26 times check on each i
// 0n - ~2->4ms
class Solution {
  int characterReplacement(String s, int k) {
    var start_window = 0, longest = 0;

    var codeUnits = s.codeUnits;

    // alphabet A->Z = 26chars
    // A = 65 in codeUnit dec -> insert e to list have to minus by 65
    final countList = List.filled(26, 0);

    var mostAppeared = 0;

    for (var i = 0; i < codeUnits.length; i++) {
      countList[codeUnits[i] - 65]++;
      mostAppeared = max(mostAppeared, countList[codeUnits[i] - 65]);

      if (!(mostAppeared >= i - start_window + 1 - k)) {
        countList[codeUnits[start_window] - 65]--;
        start_window++;
      }

      longest = max(longest, i - start_window + 1);
    }

    return longest;
  }
}
