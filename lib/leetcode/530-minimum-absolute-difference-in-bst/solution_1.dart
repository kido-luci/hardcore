import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 2
// ms
// Beats
// -%
//
class Solution {
  late int minDiff;

  int getMinimumDifference(TreeNode? root) {
    minDiff = (root!.val - (root.left?.val ?? root.right!.val)).abs();

    check(root);

    return minDiff;
  }

  void check(TreeNode root) {
    if (root.left != null) {
      checkMin(root.val, deepRight(root.left!).val);
      check(root.left!);
    }

    if (root.right != null) {
      checkMin(root.val, deepLeft(root.right!).val);
      check(root.right!);
    }
  }

  void checkMin(int first, int second) {
    minDiff = min(minDiff, (first - second).abs());
  }

  TreeNode deepLeft(TreeNode root) =>
      root.left != null ? deepLeft(root.left!) : root;

  TreeNode deepRight(TreeNode root) =>
      root.right != null ? deepRight(root.right!) : root;
}
