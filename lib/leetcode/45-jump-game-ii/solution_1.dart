// 0
// ms
// Beats
// 100.00%

class Solution {
  int jump(List<int> nums) {
    if (nums.length == 1) return 0;

    var i = 0;
    final end = nums.length - 1;
    var count = 0;

    while (i < end) {
      // print((i, nums[i]));
      // print('-----------');

      count++;
      final step = nums[i];

      if (i + step >= end) break;

      var best_j = 1;
      var best_step = nums[i + 1] - (step - 1);

      for (var j = 2; i + j < i + step + 1; j++) {
        final diff = nums[i + j] - (step - j);
        // print((nums[i + j], diff));
        if (diff >= best_step) {
          best_j = j;
          best_step = diff;
        }
      }

      i += best_j;
    }

    return count;
  }
}

void main(List<String> args) {
  print(Solution().jump([7, 0, 9, 6, 9, 6, 1, 7, 9, 0, 1, 2, 9, 0, 3]));
  // print(Solution().jump([1, 2, 3]));
}
