import 'dart:math';

import 'package:hardcore/model/binary_tree.dart';

class Solution {
  bool isBalanced(TreeNode? root) {
    if (root == null) return true;

    int leftHeight = calHeight(root.left);
    int rightHeight = calHeight(root.right);

    if ((leftHeight - rightHeight).abs() > 1) {
      return false;
    }

    return isBalanced(root.left) && isBalanced(root.right);
  }

  int calHeight(TreeNode? root, [int height = 0]) {
    if (root == null) return height;

    height++;

    return max(calHeight(root.left, height), calHeight(root.right, height));
  }
}
