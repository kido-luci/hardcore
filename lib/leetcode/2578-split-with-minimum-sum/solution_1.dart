import 'dart:math';

// 1
// ms
// Beats
// 100.00%

class Solution {
  int splitNum(int num) {
    final nums = <int>[];

    do {
      nums.add(num % 10);
      num ~/= 10;
    } while (num > 0);

    nums.sort((a, b) => b.compareTo(a));

    // print(nums);

    double sum = 0;

    for (var i = 0; i <= nums.length - 1; i++) {
      // print(nums[i]);

      sum += nums[i] * pow(10, i ~/ 2);
    }

    return sum.toInt();
  }
}

// main() {
//   print(Solution().splitNum(687));
// }
