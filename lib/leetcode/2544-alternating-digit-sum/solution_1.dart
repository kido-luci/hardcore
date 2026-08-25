// 0
// ms
// Beats
// 100.00%

class Solution {
  int alternateDigitSum(int n) {
    int sum = 0;
    int count = 0;

    while (n > 0) {
      final digit = n % 10;

      sum += count.isEven ? digit : -digit;

      count++;
      n ~/= 10;
    }

    return count.isEven ? -sum : sum;
  }
}

void main() {
  print(Solution().alternateDigitSum(5213)); //1
}
