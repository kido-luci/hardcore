import 'package:hardcore/model/binary_tree.dart';

// 0
// ms
// Beats
// 100.00%

class Solution {
  int sumNumbers(TreeNode? root) {
    if (root == null) return 0;
    var total = 0;

    void impl(TreeNode root, int sum) {
      sum = (sum * 10) + root.val;

      if (root.left == null && root.right == null) {
        total += sum;
        return;
      }

      if (root.left != null) {
        impl(root.left!, sum);
      }

      if (root.right != null) {
        impl(root.right!, sum);
      }
    }

    impl(root, 0);

    return total;
  }
}
