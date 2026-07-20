//  * Definition for a binary tree node.

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int countNodes(TreeNode? root) {
    if (root == null) return 0;

    // total nodes = 2^h - 1

    int leftCount = 0;
    TreeNode? left = root;

    while (left != null) {
      leftCount++;
      left = left.left;
    }

    int rightCount = 0;
    TreeNode? right = root;

    while (right != null) {
      rightCount++;
      right = right.right;
    }

    if (leftCount == rightCount) {
      // full tree
      return (1 << leftCount) - 1;
    }

    return 1 + countNodes(root.left) + countNodes(root.right);
  }
}
