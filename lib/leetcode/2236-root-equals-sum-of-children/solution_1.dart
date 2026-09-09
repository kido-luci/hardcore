import 'package:hardcore/model/binary_tree.dart';

// 0
// ms
// Beats
// 100.00%

class Solution {
  bool checkTree(TreeNode? root) {
    return root!.val == root.left!.val + root.right!.val;
  }
}
