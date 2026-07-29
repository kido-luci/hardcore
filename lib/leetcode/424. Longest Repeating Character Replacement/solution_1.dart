import 'dart:math';

// start_window = 0;
// longest = 0;

// loop: i -> n-1

// 	window range: start_window … end_window (i)

// 	valid window: window_len - most_appear_char <= k (maximum change can be change)

// 	while: current window not valid -> start_window++

// 	longest =  max(longest, window_len)

// => longest;

// ——

// how to cal most_appear_char in current window?

// how about create the map to count? key is char, value is appeared times
//
//700ms Onlogn
class Solution {
  int characterReplacement(String s, int k) {
    var start_window = 0, longest = 0;

    var codeUnits = s.codeUnits;

    // alphabet A->Z = 26chars
    // A = 65 in codeUnit dec -> insert e to list have to minus by 65
    final countList = List.filled(26, 0);

    for (var i = 0; i < codeUnits.length; i++) {
      countList[codeUnits[i] - 65]++;

      int calWindowLen() => i - start_window + 1;

      bool isValidWindow() {
        final mostAppeared = (List<int>.from(countList)..sort()).last;

        return calWindowLen() - mostAppeared <= k;
      }

      while (!isValidWindow()) {
        countList[codeUnits[start_window] - 65]--;
        start_window++;
      }

      longest = max(longest, calWindowLen());
    }

    return longest;
  }
}
