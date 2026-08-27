class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 1
// ms
// Beats
// 100.00%

class Solution {
  List<List<int>> zigzagLevelOrder(TreeNode? root) {
    if (root == null) return [];

    final result = <List<int>>[];

    var queue = <TreeNode>[root];

    bool revert = false;

    while (queue.isNotEmpty) {
      final new_queues = <TreeNode>[];
      final stack = List.filled(queue.length, 0);

      for (var i = 0; i < queue.length; i++) {
        stack[revert ? stack.length - 1 - i : i] = queue[i].val;

        if (queue[i].left != null) {
          new_queues.add(queue[i].left!);
        }

        if (queue[i].right != null) {
          new_queues.add(queue[i].right!);
        }
      }

      result.add(stack);

      queue = new_queues;
      revert = !revert;
    }

    return result;
  }
}
