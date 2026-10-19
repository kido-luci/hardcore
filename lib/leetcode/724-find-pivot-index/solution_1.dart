// 1
// ms
// Beats
// 84.21%

class Solution {
  int pivotIndex(List<int> nums) {
    final len = nums.length;

    int sum = 0;

    final sums = List.generate(len, (i) => sum += nums[i]);

    if (sum - sums[0] == 0) return 0;

    // print(sums);

    for (var i = 1; i < len; i++) {
      // print('$i $left $right');

      if (sums[i - 1] == sum - sums[i]) return i;
    }

    return -1;
  }
}

void main(List<String> args) {
  // print(Solution().pivotIndex([1, 7, 3, 6, 5, 6]));
  print(Solution().pivotIndex([1, 7, 3, 6, 5, 6]));
}
