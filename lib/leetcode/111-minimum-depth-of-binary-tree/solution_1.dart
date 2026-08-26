import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 4
// ms
// Beats
// 84.21%

class Solution {
  int minDepth(TreeNode? root) {
    if (root == null) return 0;
    if (root.left == null) {
      return 1 + (root.right != null ? minDepth(root.right) : 0);
    }

    return 1 +
        (root.right != null
            ? min(minDepth(root.right), minDepth(root.left))
            : minDepth(root.left));
  }
}
