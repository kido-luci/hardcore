// 2
// ms
// Beats
// 88.89%

class Solution {
  int longestPalindrome(String s) {
    final c = List.filled(52, 0);
    for (final e in s.codeUnits) {
      c[e - (e > 96 ? (97 - 26) : 65)]++;
    }

    int count = 0;
    bool haveOdd = false;

    for (final e in c) {
      count += e - (e % 2);
      haveOdd = haveOdd || e.isOdd;
    }

    if (haveOdd) count++;

    return count;
  }
}
