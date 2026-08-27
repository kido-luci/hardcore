class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 1
// ms
// Beats
// 80.00%

class Solution {
  bool isValidBST(TreeNode? root) {
    if (root == null) return true;

    if (root.right != null && (deepLeft(root.right!) ?? root.val) <= root.val) {
      return false;
    }

    if (root.left != null && (deepRight(root.left!) ?? root.val) >= root.val) {
      return false;
    }

    return isValidBST(root.left) && isValidBST(root.right);
  }

  int? deepLeft(TreeNode root) {
    if (root.left == null) return root.val;
    if (root.left!.val >= root.val) return null;

    return deepLeft(root.left!);
  }

  int? deepRight(TreeNode root) {
    if (root.right == null) return root.val;
    if (root.right!.val <= root.val) return null;

    return deepRight(root.right!);
  }
}
