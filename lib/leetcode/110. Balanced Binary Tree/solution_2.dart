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
    // if (root == null) return true;

    // int leftHeight = calHeight(root.left);
    // int rightHeight = calHeight(root.right);

    // if ((leftHeight - rightHeight).abs() > 1) {
    //   return false;
    // }

    // return isBalanced(root.left) && isBalanced(root.right);

    return calHeight(root) != -1;
  }

  int calHeight(TreeNode? root) {
    if (root == null) return 0;

    int left = calHeight(root.left);
    if (left == -1) return -1;

    int right = calHeight(root.right);
    if (right == -1) return -1;

    if ((left - right).abs() > 1) {
      return -1;
    }

    return 1 + max(left, right);
  }
}
