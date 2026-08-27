// 0
// ms
// Beats
// 100.00%

class Solution {
  int maximum69Number(int num) {
    int best = 0;
    int dept = 0;
    int level = 1;

    while (num > 0) {
      best += 9 * level;

      if (num % 10 == 6) {
        best -= dept;
        dept = 3 * level;
      }

      // print((best, dept));

      level *= 10;

      num ~/= 10;
    }

    return best;
  }
}
