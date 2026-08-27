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
  bool evaluateTree(TreeNode? root) {
    if (root == null) return true;

    switch (root.val) {
      case 0:
        return false;
      case 1:
        return true;
      case 2:
        return evaluateTree(root.left) || evaluateTree(root.right);
      default:
        return evaluateTree(root.left) && evaluateTree(root.right);
    }
  }
}
