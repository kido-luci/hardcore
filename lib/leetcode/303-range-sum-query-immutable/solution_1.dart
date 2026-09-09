// 2
// ms
// Beats
// 90.91%

class NumArray {
  late final List<int> _nums;

  NumArray(List<int> nums) {
    _nums = nums;

    for (var i = 1; i < _nums.length; i++) {
      _nums[i] += _nums[i - 1];
    }
  }

  int sumRange(int left, int right) {
    return _nums[right] - (left > 0 ? _nums[left - 1] : 0);
  }
}
