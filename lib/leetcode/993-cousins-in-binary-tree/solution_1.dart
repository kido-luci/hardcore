class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 0
// ms
// Beats
// 100.00%

class Solution {
  bool isCousins(TreeNode? root, int x, int y) {
    var queues = <(TreeNode, int)>[if (root != null) (root, -1)];

    while (queues.isNotEmpty) {
      int x_root = -1, y_root = -1;

      final new_queue = <(TreeNode, int)>[];

      for (final q in queues) {
        if (q.$1.val == x) {
          x_root = q.$2;
        } else if (q.$1.val == y) {
          y_root = q.$2;
        } else {
          if (q.$1.left != null) {
            new_queue.add((q.$1.left!, q.$1.val));
          }
          if (q.$1.right != null) {
            new_queue.add((q.$1.right!, q.$1.val));
          }
        }
      }

      if (x_root != -1) {
        return y_root != -1 && x_root != y_root;
      }

      if (y_root != -1) return false;

      queues = new_queue;
    }

    return false;
  }
}
