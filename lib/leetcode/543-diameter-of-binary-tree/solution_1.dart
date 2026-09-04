import 'dart:math';

import 'package:hardcore/model/binary_tree.dart';

// 1
// ms
// Beats
// 94.44%

class Solution {
  int best = 0;

  int diameterOfBinaryTree(TreeNode? root) {
    check(root);

    return best;
  }

  int check(TreeNode? root) {
    if (root == null) return 0;

    final left = check(root.left);
    final right = check(root.right);

    // print((root.val, left, right));

    best = max(best, left + right);

    // print('---');

    return 1 + max(left, right);
  }
}
