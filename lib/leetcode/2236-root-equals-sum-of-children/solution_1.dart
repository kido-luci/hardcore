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
  bool checkTree(TreeNode? root) {
    return root!.val == root.left!.val + root.right!.val;
  }
}
