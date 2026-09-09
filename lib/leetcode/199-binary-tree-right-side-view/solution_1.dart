import 'package:hardcore/model/binary_tree.dart';

// 1
// ms
// Beats
// 76.92%

class Solution {
  List<int> rightSideView(TreeNode? root) {
    if (root == null) return [];

    final result = <int>[];

    var queues = <TreeNode>[root];

    while (queues.isNotEmpty) {
      final new_queues = <TreeNode>[];

      late int val;

      for (final e in queues) {
        val = e.val;

        if (e.left != null) {
          new_queues.add(e.left!);
        }

        if (e.right != null) {
          new_queues.add(e.right!);
        }
      }

      result.add(val);

      queues = new_queues;
    }

    return result;
  }
}
