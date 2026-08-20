// * Definition for a binary tree node.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 1
// ms
// Beats
// 36.36%
//
class Solution {
  List<int> postorderTraversal(TreeNode? root) {
    if (root == null) return [];

    return [
      ...postorderTraversal(root.left),
      ...postorderTraversal(root.right),
      root.val,
    ];
  }
}
