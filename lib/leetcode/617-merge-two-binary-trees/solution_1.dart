import 'package:hardcore/model/binary_tree.dart';

// 0
// ms
// Beats
// 100.00%

class Solution {
  TreeNode? mergeTrees(TreeNode? root1, TreeNode? root2) {
    if (root1 == null || root2 == null) return root1 ?? root2;

    return root1
      ..val = root1.val + root2.val
      ..left = mergeTrees(root1.left, root2.left)
      ..right = mergeTrees(root1.right, root2.right);
  }
}
