import 'package:hardcore/model/binary_tree.dart';

// 1
// ms
// Beats
// 36.36%
//
class Solution {
  List<int> postorderTraversal(TreeNode? root) {
    if (root == null) return [];

    return [
      ...postorderTraversal(root.left),
      ...postorderTraversal(root.right),
      root.val,
    ];
  }
}
