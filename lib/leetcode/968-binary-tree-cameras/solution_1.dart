import 'package:hardcore/model/binary_tree.dart';

// 1
// ms
// Beats
// 100.00%

class Solution {
  // 0 = free
  // 1 = flex
  // 2 = fixed

  int minCameraCover(TreeNode? root) {
    int move = 0;

    int impl(TreeNode? root) {
      if (root == null) return 0;

      int left = impl(root.left);
      int right = impl(root.right);

      if (left == 0 && right == 0) return 1;

      if (left == 1 || right == 1) {
        move++;
        return 2;
      }

      return 0;
    }

    if (impl(root) == 1) move++;

    return move;
  }
}
