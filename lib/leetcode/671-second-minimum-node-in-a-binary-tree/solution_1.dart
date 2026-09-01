import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 0
// ms
// Beats
// 100.00%

class Solution {
  int findSecondMinimumValue(TreeNode? root) {
    if (root == null) return -1;
    final val = root.val;

    int? check(TreeNode? root) {
      if (root == null) return null;
      if (root.val != val) return root.val;
      final left = check(root.left);
      final right = check(root.right);

      if (left != null && right != null) return min(left, right);
      return left ?? right;
    }

    return check(root) ?? -1;
  }
}
