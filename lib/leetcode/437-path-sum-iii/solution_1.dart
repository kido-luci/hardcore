class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 29
// ms
// Beats
// 42.86%
class Solution {
  int pathSum(TreeNode? root, int targetSum) {
    if (root == null) return 0;

    var count = 0;

    List<int> impl(TreeNode root) {
      final result = <int>[root.val];

      if (root.val == targetSum) count++;

      if (root.left != null) {
        for (final e in impl(root.left!)) {
          final path = root.val + e;
          if (path == targetSum) count++;
          result.add(path);
        }
      }

      if (root.right != null) {
        for (final e in impl(root.right!)) {
          final path = root.val + e;
          if (path == targetSum) count++;
          result.add(path);
        }
      }

      return result;
    }

    impl(root);

    return count;
  }
}
