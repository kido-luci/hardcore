// 3
// ms
// Beats
// 100.00%

class Solution {
  List<int> maxSumOfThreeSubarrays(List<int> nums, int k) {
    // final clone = List.of(nums);

    // print('input $nums');

    for (var i = 1; i < nums.length; i++) nums[i] += nums[i - 1];

    // print('pre_sum: $nums');

    final s_k = List.generate(
      nums.length - k + 1,
      (i) => nums[i + k - 1] - (i == 0 ? 0 : nums[i - 1]),
    );

    // print('sub_k: $s_k');

    var best_l = 0;
    var best_r = -1;

    var result = <int>[];
    var best = 0;

    for (var i = k; i < s_k.length - k; i++) {
      if (s_k[i - k] > s_k[best_l]) best_l = i - k;
      if (best_r < i + k) {
        best_r = i + k;

        for (var j = best_r + 1; j < s_k.length; j++) {
          if (s_k[j] > s_k[best_r]) best_r = j;
        }
      }

      final sum = s_k[best_l] + s_k[i] + s_k[best_r];

      // print((best_l, i, best_r));
      // print('sum: $sum');
      if (sum > best) {
        best = sum;
        result = [best_l, i, best_r];
      }
      // print(
      //   '${clone.sublist(best_l, best_l + k)}-${clone.sublist(i, i + k)}-${clone.sublist(best_r, best_r + k)}',
      // );
    }

    return result;
  }
}

void main(List<String> args) {
  // print(Solution().maxSumOfThreeSubarrays([1, 2, 1, 2, 6, 7, 5, 1], 2));
  print(
    Solution().maxSumOfThreeSubarrays([
      17,
      7,
      19,
      11,
      1,
      19,
      17,
      6,
      13,
      18,
      2,
      7,
      12,
      16,
      16,
      18,
      9,
      3,
      19,
      5,
    ], 6),
  );
}
