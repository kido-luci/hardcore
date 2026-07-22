class Solution {
  List<int> productExceptSelf(List<int> nums) {
    final result = <int>[];

    for (var i = 0; i < nums.length; i++) {
      int productLeft = 1;
      int productRight = 1;

      for (var j = 0; j < i; j++) {
        productLeft *= nums[j];
      }

      print('left: 0 => ${i - 1}');

      for (var j = i + 1; j < nums.length; j++) {
        productRight *= nums[j];
      }

      print('right: ${i + 1} => ${nums.length - 1}');

      result.add(productLeft * productRight);

      print('====');
    }

    return result;
  }
}
