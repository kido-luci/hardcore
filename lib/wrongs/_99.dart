import 'package:hardcore/model/binary_tree.dart';

// 927 / 1919 testcases passed
class Solution {
  void recoverTree(TreeNode? root) {
    if (root == null) return;

    if (root.left != null) {
      if (root.val < root.left!.val) return swapTree(root, root.left!);
      if (!deep_right(root.left!, root)) return;
    }

    if (root.right != null) {
      if (root.val > root.right!.val) return swapTree(root, root.right!);
      if (!deep_left(root.right!, root)) return;
    }

    recoverTree(root.left);
    recoverTree(root.right);
  }

  void swapTree(TreeNode t1, TreeNode t2) {
    final tmp = t1.val;
    t1.val = t2.val;
    t2.val = tmp;
  }

  bool deep_left(TreeNode root, TreeNode parent) {
    if (root.left == null) {
      if (parent.val > root.val) {
        swapTree(parent, root);
        return false;
      }

      return true;
    }

    if (root.val < root.left!.val) {
      swapTree(root, root.left!);
      return false;
    }

    return deep_left(root.left!, parent);
  }

  bool deep_right(TreeNode root, TreeNode parent) {
    if (root.right == null) {
      if (parent.val < root.val) {
        swapTree(parent, root);
        return false;
      }

      return true;
    }

    if (root.val > root.right!.val) {
      swapTree(root, root.right!);
      return false;
    }

    return deep_right(root.right!, parent);
  }
}
