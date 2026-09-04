import 'package:hardcore/model/binary_tree.dart';

// 1
// ms
// Beats
// 100.00%

class Solution {
  int result = 0;

  int findTilt(TreeNode? root) {
    impl(root);

    return result;
  }

  int impl(TreeNode? root) {
    if (root == null) return 0;

    final s_left = impl(root.left);
    final s_right = impl(root.right);

    // print((s_left, s_right));

    result += (s_left - s_right).abs();

    return root.val + s_left + s_right;
  }
}
