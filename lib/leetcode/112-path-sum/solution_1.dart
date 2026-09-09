import 'package:hardcore/model/binary_tree.dart';

// 0
// ms
// Beats
// 100.00%

class Solution {
  bool hasPathSum(TreeNode? root, int targetSum) {
    if (root == null) return false;

    if (root.val == targetSum && root.left == null && root.right == null)
      return true;

    return hasPathSum(root.left, targetSum - root.val) ||
        hasPathSum(root.right, targetSum - root.val);
  }
}
