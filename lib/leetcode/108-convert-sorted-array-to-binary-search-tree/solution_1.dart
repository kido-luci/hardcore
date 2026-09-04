import 'package:hardcore/model/binary_tree.dart';

// 1
// ms
// Beats
// 90.00%

class Solution {
  TreeNode? sortedArrayToBST(List<int> nums) {
    if (nums.isEmpty) return null;

    return sortedArrayToBSTWithIndex(nums, 0, nums.length - 1);
  }

  TreeNode? sortedArrayToBSTWithIndex(List<int> nums, int left, int right) {
    if (nums.isEmpty) return null;

    int mid = ((right - left) ~/ 2) + left;

    // print((nums[mid], nums.sublist(left, right + 1)));

    return TreeNode(
      nums[mid],
      mid > left ? sortedArrayToBSTWithIndex(nums, left, mid - 1) : null,
      mid + 1 <= right ? sortedArrayToBSTWithIndex(nums, mid + 1, right) : null,
    );
  }
}
