// 5
// ms
// Beats
// 100.00%

class Solution {
  int distinctAverages(List<int> nums) {
    nums.sort();

    final types = <double>{};

    for (var i = 0; i < nums.length ~/ 2; i++) {
      types.add((nums[i] + nums[nums.length - 1 - i]) / 2);
    }

    return types.length;
  }
}

void main(List<String> args) {
  print(Solution().distinctAverages([4, 1, 4, 0, 3, 5]));
}
