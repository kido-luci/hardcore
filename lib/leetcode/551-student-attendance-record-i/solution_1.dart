// 0
// ms
// Beats
// 100.00%

class Solution {
  bool checkRecord(String s) {
    int late = 0;
    int absent = 0;

    for (var i = 0; i < s.length; i++) {
      switch (s[i]) {
        case 'L':
          if (++late > 2) return false;
          break;
        case 'A':
          if (++absent > 1) return false;
          late = 0;
          break;
        default:
          late = 0;
      }
    }

    return true;
  }
}
