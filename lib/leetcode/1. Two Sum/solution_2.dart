// 58 ms
class Solution {
  List<int> twoSum(List<int> nums, int target) {
    final Map map = <int, int>{};
    for (var i = 0; i < nums.length; i++) {
      if (map[nums[i]] != null && nums[i] * 2 == target) {
        return [map[nums[i]], i];
      }

      map[nums[i]] = i;
    }

    // print(map);

    for (var e in map.entries) {
      final x = target - e.key;
      final index = map[x];

      if (index != null && index != e.value) {
        return [e.value, index];
      }
    }

    return [];
  }
}
