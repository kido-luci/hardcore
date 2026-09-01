import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 3
// ms
// Beats
// 100.00%

class Solution {
  List<int> largestValues(TreeNode? root) {
    if (root == null) return [];

    var queue = <TreeNode>[root];

    final result = <int>[];

    while (queue.isNotEmpty) {
      final new_queue = <TreeNode>[];

      void add_2_q(TreeNode? root) {
        if (root != null) {
          new_queue.add(root);
        }
      }

      int largest = queue.first.val;

      for (final e in queue) {
        largest = max(largest, e.val);

        add_2_q(e.left);
        add_2_q(e.right);
      }

      result.add(largest);

      queue = new_queue;
    }

    return result;
  }
}
