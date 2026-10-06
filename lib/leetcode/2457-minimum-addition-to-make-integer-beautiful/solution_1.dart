// 0
// ms
// Beats
// 100.00%

class Solution {
  int makeIntegerBeautiful(int n, int target) {
    int need = 0;

    int cal_sum(int n) {
      var sum = 0;

      while (n > 0) {
        sum += n % 10;
        n ~/= 10;
      }

      return sum;
    }

    int cal_need(int n) {
      int level = 1;
      while (n > 0) {
        final digit = n % 10;
        if (digit > 0) return (10 - digit) * level;
        level *= 10;
        n ~/= 10;
      }

      return level;
    }

    var sum = cal_sum(n);

    while (sum > target) {
      need += cal_need(n + need);
      sum = cal_sum(n + need);
    }

    return need;
  }
}

void main(List<String> args) {
  print(Solution().makeIntegerBeautiful(467, 6));
}
