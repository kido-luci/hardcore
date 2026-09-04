import 'package:hardcore/model/binary_tree.dart';

// 2
// ms
// Beats
// 100.00%

class Solution {
  List<double> averageOfLevels(TreeNode? root) {
    final result = <double>[];

    var stacks = <TreeNode>[if (root != null) root];
    while (stacks.isNotEmpty) {
      final n_stacks = <TreeNode>[];

      result.add(
        stacks.fold(0, (s, e) {
              if (e.left != null) n_stacks.add(e.left!);
              if (e.right != null) n_stacks.add(e.right!);

              return s + e.val;
            }) /
            stacks.length,
      );

      stacks = n_stacks;
    }

    return result;
  }
}
