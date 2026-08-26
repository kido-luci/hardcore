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
  TreeNode? searchBST(TreeNode? root, int val) {
    if (root == null || root.val == val) return root;

    if (root.val <= val) {
      final right = searchBST(root.right, val);

      if (right != null) return right;
    }

    return root.val >= val ? searchBST(root.left, val) : null;
  }
}
