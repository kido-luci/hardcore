import 'package:hardcore/model/binary_tree.dart';
import 'package:hardcore/model/linked_list.dart';

// 1
// ms
// Beats
// 100.00%

class Solution {
  TreeNode? sortedListToBST(ListNode? head) {
    final toList = <int>[];

    while (head != null) {
      toList.add(head.val);
      head = head.next;
    }

    return sortedArrayToBSTWithIndex(toList, 0, toList.length - 1);
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
