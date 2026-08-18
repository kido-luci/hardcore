// 4
// ms
// Beats
// 100.00%

class Solution {
  int countDigitOccurrences(List<int> nums, int digit) {
    int count = 0;

    for (var e in nums) {
      while (e > 0) {
        if (e % 10 == digit) {
          count++;
        }

        e ~/= 10;
      }
    }

    return count;
  }
}
