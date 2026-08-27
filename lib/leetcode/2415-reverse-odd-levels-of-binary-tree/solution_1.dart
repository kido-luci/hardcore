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
  TreeNode? reverseOddLevels(TreeNode? root) {
    if (root == null) return null;

    final result = root;

    var queues = <TreeNode>[root];
    bool isOdd = false;

    var len = 1;

    while (len > 0) {
      final new_queues = <TreeNode>[];
      // print(queues.map((e) => e.val).toList());

      for (var i = 0; i < len; i++) {
        if (isOdd && i < len ~/ 2) {
          final tmp = queues[i].val;
          queues[i].val = queues[len - 1 - i].val;
          queues[len - 1 - i].val = tmp;
        }

        if (queues[i].left != null) {
          new_queues.add(queues[i].left!);
        }

        if (queues[i].right != null) {
          new_queues.add(queues[i].right!);
        }
      }

      isOdd = !isOdd;
      queues = new_queues;
      len = queues.length;
    }

    return result;
  }
}
