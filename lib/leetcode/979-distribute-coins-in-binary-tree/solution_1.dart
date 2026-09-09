// 1
// ms
// Beats
// 100.00%

import 'package:hardcore/model/binary_tree.dart';

class Solution {
  int distributeCoins(TreeNode? root) {
    int move = 0;

    int check(TreeNode? root) {
      if (root == null) return 0;

      final left = check(root.left);
      final right = check(root.right);

      move += left.abs() + right.abs();

      return right + left + root.val - 1;
    }

    check(root);

    return move;
  }
}
