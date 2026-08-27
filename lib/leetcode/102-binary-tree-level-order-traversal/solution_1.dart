class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 2
// ms
// Beats
// 84.21%

class Solution {
  List<List<int>> levelOrder(TreeNode? root) {
    if (root == null) return [];

    final result = <List<int>>[];

    var queues = <TreeNode>[root];

    while (queues.isNotEmpty) {
      final new_queues = <TreeNode>[];
      final stack = <int>[];

      for (final e in queues) {
        stack.add(e.val);

        if (e.left != null) {
          new_queues.add(e.left!);
        }

        if (e.right != null) {
          new_queues.add(e.right!);
        }
      }

      result.add(stack);

      queues = new_queues;
    }

    return result;
  }
}
