// 26
// ms
// Beats
// -%
class Solution {
  List<int> nextGreaterElements(List<int> nums) {
    final result = List<int?>.filled(nums.length, null);
    final stack = <int>[];

    for (var j = nums.length - 1; j >= 0; j--) {
      final val = nums[j];
      while (stack.isNotEmpty && stack.last <= val) stack.removeLast();
      if (stack.isNotEmpty) result[j] = stack.last;
      stack.add(val);
    }

    for (var j = nums.length - 1; j >= 0; j--) {
      if (result[j] != null) continue;
      final val = nums[j];
      for (var j1 = stack.length - 1; j1 >= 0; j1--) {
        if (stack[j1] > val) {
          result[j] = stack[j1];
          break;
        }
      }
    }

    return result.map((e) => e ?? -1).toList();
  }
}

void main(List<String> args) {
  print(Solution().nextGreaterElements([1, 2, 3, 2, 1]));
}
