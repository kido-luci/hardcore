class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 8
// ms
// Beats
// 100.00%

class Solution {
  int findBottomLeftValue(TreeNode? root) {
    var queue = <TreeNode>[root!];

    while (queue.isNotEmpty) {
      final new_queue = <TreeNode>[];

      void add_2_q(TreeNode? root) {
        if (root != null) {
          new_queue.add(root);
        }
      }

      for (final e in queue) {
        add_2_q(e.left);
        add_2_q(e.right);
      }

      if (new_queue.isEmpty) return queue.first.val;

      queue = new_queue;
    }

    return root.val;
  }
}
