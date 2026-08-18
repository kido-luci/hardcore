import 'dart:math';

// 3
// ms
// Beats
// 100.00%

class Solution {
  int maxFreqSum(String s) {
    // vowel (one of 'a', 'e', 'i', 'o', or 'u')
    //
    final counters = List.filled(26, 0);
    var m_vowel = 0;
    var m_consonant = 0;

    for (final e in s.codeUnits) {
      // [97, 101, 105, 111, 117]
      switch (e) {
        case 97:
        case 101:
        case 105:
        case 111:
        case 117:
          m_vowel = max(m_vowel, ++counters[e - 97]);
          //   print((m_vowel, counters[e - 97]));
          break;
        default:
          m_consonant = max(m_consonant, ++counters[e - 97]);
      }
    }

    return m_vowel + m_consonant;
  }
}
