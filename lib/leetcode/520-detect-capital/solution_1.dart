// 1
// ms
// Beats
// 88.89%
class Solution {
  bool detectCapitalUse(String word) {
    int count_cap = 0;

    for (final e in word.codeUnits) {
      if (e < 97) count_cap++;
    }

    return count_cap == 0 ||
        count_cap == word.length ||
        (count_cap == 1 && word.codeUnitAt(0) < 97);
  }
}
