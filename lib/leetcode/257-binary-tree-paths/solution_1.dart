class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 10
// ms
// Beats
// -%

class Solution {
  List<String> binaryTreePaths(TreeNode? root) {
    if (root == null) return [];

    List<List<int>> impl(TreeNode root) {
      if (root.left == null && root.right == null)
        return [
          [root.val],
        ];

      final paths = <List<int>>[];

      if (root.left != null) {
        for (final e in impl(root.left!)) {
          paths.add([root.val, ...e]);
        }
      }

      if (root.right != null) {
        for (final e in impl(root.right!)) {
          paths.add([root.val, ...e]);
        }
      }

      return paths;
    }

    return impl(root).map((e) {
      final buffer = StringBuffer();

      for (var i = 0; i < e.length; i++) {
        buffer.write('${i != 0 ? '->' : ''}${e[i]}');
      }

      return buffer.toString();
    }).toList();
  }
}
