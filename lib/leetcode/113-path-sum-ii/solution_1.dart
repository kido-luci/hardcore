class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 12
// ms
// Beats
// -%
class Solution {
  List<List<int>> pathSum(TreeNode? root, int targetSum) {
    if (root == null) return [];

    List<(List<int>, int)> impl(TreeNode root) {
      if (root.left == null && root.right == null)
        return [
          ([root.val], root.val),
        ];

      final paths = <(List<int>, int)>[];

      if (root.left != null) {
        for (final e in impl(root.left!)) {
          paths.add(([root.val, ...e.$1], root.val + e.$2));
        }
      }

      if (root.right != null) {
        for (final e in impl(root.right!)) {
          paths.add(([root.val, ...e.$1], root.val + e.$2));
        }
      }

      return paths;
    }

    final result = <List<int>>[];

    final paths = impl(root);

    for (final e in paths) {
      if (e.$2 == targetSum) result.add(e.$1);
    }

    return result;
  }
}
