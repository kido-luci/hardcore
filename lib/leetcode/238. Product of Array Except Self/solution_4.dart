//11ms
class Solution {
  List<int> productExceptSelf(List<int> nums) {
    final lefts = List.filled(nums.length, 1);
    final rights = List.filled(nums.length, 1);

    final length = nums.length;

    var left = 1;
    var right = 1;

    for (var j = 0; j < length; j++) {
      lefts[j] = left *= nums[j];
      rights[j] = right *= nums[length - j - 1];
    }

    // print(lefts);
    // print(rights);

    final result = <int>[];

    for (var i = 0; i < length; i++) {
      final left = i <= 0 ? 1 : lefts[i - 1];
      final right = i >= length - 1 ? 1 : rights[(length - 1) - i - 1];

      // print(left);
      // print(right);
      // print('---');

      result.add(left * right);
    }

    return result;
  }
}
