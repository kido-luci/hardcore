// 58 ms
class Solution {
  List<int> twoSum(List<int> nums, int target) {
    final map = <int, int>{};
    for (var i = 0; i < nums.length; i++) {
      final x = target - nums[i];
      final index = map[x];

      if (index != null) {
        return [i, index];
      }

      map[nums[i]] = i;
    }

    return [];
  }
}
