import 'dart:math';

import 'package:hardcore/model/binary_tree.dart';

// 1
// ms
// Beats
// 100.00%

class Solution {
  int rob(TreeNode? root) {
    if (root == null) return 0;

    (int, int) impl(TreeNode? root) {
      if (root == null) return (0, 0);

      final (l_r, l_c) = impl(root.left);
      final (r_r, r_c) = impl(root.right);

      return (
        root.val +
            max<int>(l_c, l_r - (root.left?.val ?? 0)) +
            max<int>(r_c, r_r - (root.right?.val ?? 0)),
        max(l_r, l_c) + max(r_r, r_c),
      );
    }

    final (r, c) = impl(root);

    return max(r, c);
  }
}
