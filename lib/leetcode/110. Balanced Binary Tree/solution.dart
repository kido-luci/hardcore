// * Definition for a binary tree node.
import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isBalanced(TreeNode? root) {
    if (root == null) return true;

    int leftHeight = calHeight(root.left);
    int rightHeight = calHeight(root.right);

    if ((leftHeight - rightHeight).abs() > 1) {
      return false;
    }

    return isBalanced(root.left) && isBalanced(root.right);
  }

  int calHeight(TreeNode? root, [int height = 0]) {
    if (root == null) return height;

    height++;

    return max(calHeight(root.left, height), calHeight(root.right, height));
  }
}
