class Solution {
  List<int> productExceptSelf(List<int> nums) {
    final result = <int>[];
    final mapProduct = <String, int>{};

    var left = 1;
    for (var j = 0; j < nums.length; j++) {
      mapProduct['0_$j'] = left *= nums[j];
    }

    var right = 1;
    for (var j = nums.length - 1; j > 0; j--) {
      mapProduct['${j}_${nums.length - 1}'] = right *= nums[j];
    }

    for (var i = 0; i < nums.length; i++) {
      result.add(
        (mapProduct['0_${i - 1}'] ?? 1) *
            (mapProduct['${i + 1}_${nums.length - 1}'] ?? 1),
      );
    }

    return result;
  }
}
