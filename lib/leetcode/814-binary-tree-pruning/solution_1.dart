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
  TreeNode? pruneTree(TreeNode? root) {
    if (root == null) return null;

    root.left = pruneTree(root.left);
    root.right = pruneTree(root.right);

    return (root.val == 0 && root.right == null && root.left == null)
        ? null
        : root;
  }
}
