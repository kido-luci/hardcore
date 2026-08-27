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
  void flatten(TreeNode? root) {
    if (root == null) return;

    if (root.left != null) {
      deephRight(root.left!).right = root.right;
      root.right = root.left;
      root.left = null;
    }

    flatten(root.right);
  }

  TreeNode deephRight(TreeNode root) {
    if (root.right == null) return root;

    return deephRight(root.right!);
  }
}
