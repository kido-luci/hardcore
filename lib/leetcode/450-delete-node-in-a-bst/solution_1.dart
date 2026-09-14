import 'package:hardcore/model/binary_tree.dart';

// 1
// ms
// Beats
// -%
class Solution {
  TreeNode? deleteNode(TreeNode? root, int key) {
    if (root == null) return null;

    (TreeNode?, bool) impl(TreeNode root, int key) {
      if (root.val != key) {
        if (root.left != null) {
          final left = impl(root.left!, key);
          root.left = left.$1;

          if (left.$2) return (root, true);
        }

        if (root.right != null) {
          final right = impl(root.right!, key);
          root.right = right.$1;

          if (right.$2) return (root, true);
        }

        return (root, false);
      }

      if (root.left == null || root.right == null)
        return (root.left ?? root.right, true);

      var left_r = root.left!;

      while (left_r.right != null) {
        left_r = left_r.right!;
      }

      left_r.right = root.right;

      return (root.left, true);
    }

    return impl(root, key).$1;
  }
}

void main(List<String> args) {
  // print(Solution().deleteNode(TreeNode.fromList([0]), 0));
  print(Solution().deleteNode(TreeNode.fromList([5, 3, 6, 2, 4, null, 7]), 5));
  // print(Solution().deleteNode(TreeNode.fromList([1, null, 2]), 1)?.val);
}
