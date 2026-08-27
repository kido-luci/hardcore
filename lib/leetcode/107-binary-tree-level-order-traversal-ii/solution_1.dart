class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 2
// ms
// Beats
// 100.00%

class Solution {
  List<List<int>> levelOrderBottom(TreeNode? root) {
    if (root == null) return [];

    final result = <List<int>>[];

    var queues = <TreeNode>[root];

    while (queues.isNotEmpty) {
      final new_queues = <TreeNode>[];
      final values = <int>[];

      for (final e in queues) {
        values.add(e.val);

        if (e.left != null) {
          new_queues.add(e.left!);
        }

        if (e.right != null) {
          new_queues.add(e.right!);
        }
      }

      result.add(values);

      queues = new_queues;
    }

    return result.reversed.toList();
  }
}
