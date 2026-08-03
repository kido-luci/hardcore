import 'dart:math';

// 240ms 0n^2
//
// Input: s = "abcabcbb"
// Output: 3

// abcabcbb
// abc
//  bca
//   cab
class Solution {
  int lengthOfLongestSubstring(String s) {
    var longest = 0;

    // final unicodeIndex = List.filled(127, 0);
    final unicodeIndex = <int, int>{};

    final char = s.codeUnits;
    for (var i = 0; i < char.length; i++) {
      var j = i;

      while (j >= 0) {
        if (unicodeIndex[char[j]] != null) {
          break;
        }

        unicodeIndex[char[j]] = 1;

        j--;
      }

      unicodeIndex.clear();
      longest = max(longest, i - j);
    }

    return longest;
  }
}
