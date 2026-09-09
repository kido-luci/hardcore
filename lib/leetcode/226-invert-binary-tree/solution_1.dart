import 'package:hardcore/model/binary_tree.dart';

// 0
// ms
// Beats
// 100.00%

class Solution {
  TreeNode? invertTree(TreeNode? root) {
    impl(root);

    return root;
  }

  void impl(TreeNode? root) {
    if (root == null) return;

    TreeNode? tmp = root.left;
    root.left = root.right;
    root.right = tmp;

    impl(root.left);
    impl(root.right);
  }
}
