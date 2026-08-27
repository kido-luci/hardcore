class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 4
// ms
// Beats
// 100.00%

class Solution {
  int deepestLeavesSum(TreeNode? root) {
    if (root == null) return 0;

    int sum = 0;

    var queues = <TreeNode>[root];

    while (queues.isNotEmpty) {
      sum = 0;

      final new_queues = <TreeNode>[];

      for (final e in queues) {
        sum += e.val;

        if (e.left != null) {
          new_queues.add(e.left!);
        }

        if (e.right != null) {
          new_queues.add(e.right!);
        }
      }

      queues = new_queues;
    }

    return sum;
  }
}
