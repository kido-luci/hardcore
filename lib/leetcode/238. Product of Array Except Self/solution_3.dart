// 300ms
class Solution {
  List<int> productExceptSelf(List<int> nums) {
    final result = <int>[];
    final mapProduct = <String, int>{};

    final length = nums.length;

    var left = 1;
    var right = 1;

    for (var j = 0; j < length; j++) {
      if (left != 0) {
        mapProduct['0_$j'] = left *= nums[j];
      }

      if (right != 0) {
        mapProduct['${length - j - 1}_${length - 1}'] = right *=
            nums[length - j - 1];
      }

      if (left == 0 && right == 0) {
        break;
      }

      // print(mapProduct);
    }

    for (var i = 0; i < length; i++) {
      final left = i <= 0 ? 1 : mapProduct['0_${i - 1}'] ?? 0;
      final right = i >= length - 1
          ? 1
          : mapProduct['${i + 1}_${length - 1}'] ?? 0;

      result.add(left * right);
    }

    return result;
  }
}
