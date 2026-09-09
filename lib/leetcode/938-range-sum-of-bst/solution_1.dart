import 'package:hardcore/model/binary_tree.dart';

// 2
// ms
// Beats
// 100.00%

class Solution {
  int rangeSumBST(TreeNode? root, int low, int high) {
    if (root == null) return 0;

    return (root.val >= low && root.val <= high ? root.val : 0) +
        rangeSumBST(root.left, low, high) +
        rangeSumBST(root.right, low, high);
  }
}
