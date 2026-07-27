import 'dart:math';

// On 2-3ms
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
    var lastBreak = 0;

    final charIndex = List.filled(127, -1);

    final char = s.codeUnits;
    // print(char);

    for (var i = 0; i < char.length; i++) {
      // print(charIndex[char[i]]);

      // When O[i] is dup
      // change the lastbreak = charIndex[char[i]]
      // new windown:  charIndex[char[i]]..i
      // delete windown: lastbreak... charIndex[char[i]]
      if (charIndex[char[i]] != -1) {
        while (lastBreak <= charIndex[char[i]]) {
          charIndex[char[lastBreak]] = -1;
          lastBreak++;
        }
      }

      // store the char index
      charIndex[char[i]] = i;

      // print(char.sublist(lastBreak, i + 1));

      longest = max(longest, i - lastBreak + 1);
    }

    return longest;
  }
}
