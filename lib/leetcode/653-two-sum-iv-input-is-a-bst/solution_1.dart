import 'package:hardcore/model/binary_tree.dart';

// 8
// ms
// Beats
// 100.00%

class Solution {
  final exits = <int>{};

  bool findTarget(TreeNode? root, int k) {
    if (root == null) return false;
    if (exits.contains(k - root.val)) return true;
    exits.add(root.val);

    return findTarget(root.left, k) || findTarget(root.right, k);
  }
}
