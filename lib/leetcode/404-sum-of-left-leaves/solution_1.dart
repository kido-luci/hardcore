import 'package:hardcore/model/binary_tree.dart';

// 0
// ms
// Beats
// 100.00%

class Solution {
  int sumOfLeftLeaves(TreeNode? root) {
    return _impl(root?.left, true) + _impl(root?.right, false);
  }

  int _impl(TreeNode? r, bool is_l) {
    if (r == null) return 0;
    if (r.left == null && r.right == null) return is_l ? r.val : 0;

    return _impl(r.left, true) + _impl(r.right, false);
  }
}
