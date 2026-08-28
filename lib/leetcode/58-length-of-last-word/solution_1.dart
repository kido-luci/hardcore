// 0
// ms
// Beats
// 100.00%

class Solution {
  int lengthOfLastWord(String s) {
    int count = 0;

    for (var j = s.length - 1; j >= 0; j--) {
      if (s.codeUnitAt(j) == 32) {
        if (count > 0) break;
      } else {
        count++;
      }
    }

    return count;
  }
}
