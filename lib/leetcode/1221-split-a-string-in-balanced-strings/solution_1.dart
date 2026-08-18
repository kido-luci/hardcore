// 0
// ms
// Beats
// 100.00%

class Solution {
  int balancedStringSplit(String s) {
    int left = 0, right = 0;
    int count = 0;

    for (var j = 0; j < s.length; j++) {
      if (s[j] == 'L') {
        left++;
      } else {
        right++;
      }

      if (left == right) {
        left = right = 0;
        count++;
      }
    }

    return count;
  }
}
