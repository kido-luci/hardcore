class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// Runtime
// 0
// ms
// Beats
// 100.00%

class Solution {
  bool isSameTree(TreeNode? p, TreeNode? q) {
    if (p == null && q == null) return true;
    if (p?.val != q?.val) return false;

    if (!isSameTree(p?.left, q?.left)) return false;

    return isSameTree(p?.right, q?.right);
  }
}
