import 'package:hardcore/model/binary_tree.dart';

// 0
// ms
// Beats
// 100.00%

class Solution {
  bool isUnivalTree(TreeNode? root) {
    if (root == null) return true;

    return check(root, root.val);
  }

  bool check(TreeNode? root, int val) {
    if (root == null) return true;

    return root.val == val && check(root.left, val) && check(root.right, val);
  }
}
