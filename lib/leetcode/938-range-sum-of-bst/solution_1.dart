// * Definition for a binary tree node.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 2
// ms
// Beats
// 100.00%

class Solution {
  int rangeSumBST(TreeNode? root, int low, int high) {
    if (root == null) return 0;

    return (root.val >= low && root.val <= high ? root.val : 0) +
        rangeSumBST(root.left, low, high) +
        rangeSumBST(root.right, low, high);
  }
}
