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
  bool hasPathSum(TreeNode? root, int targetSum) {
    if (root == null) return false;

    if (root.val == targetSum && root.left == null && root.right == null)
      return true;

    return hasPathSum(root.left, targetSum - root.val) ||
        hasPathSum(root.right, targetSum - root.val);
  }
}
