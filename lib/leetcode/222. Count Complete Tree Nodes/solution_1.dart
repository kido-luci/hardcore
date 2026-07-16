// Definition for a binary tree node.
import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int countNodes(TreeNode? root) {
    if (root == null) return 0;

    int leftH = 0;
    TreeNode? leftNode = root;
    while (leftNode != null) {
      leftH++;
      leftNode = leftNode.left;
    }

    int rightH = 0;
    TreeNode? rightNode = root;
    while (rightNode != null) {
      rightH++;
      rightNode = rightNode.right;
    }

    if (leftH == rightH) {
      return pow(2, leftH).toInt() - 1;
    }

    return 1 + countNodes(root.left) + countNodes(root.right);
  }
}
