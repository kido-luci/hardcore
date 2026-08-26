import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 23
// ms
// Beats
// 100.00%

class Solution {
  final count = <int, int>{};
  var max_count = 1;

  List<int> findMode(TreeNode? root) {
    check(root);

    final results = <int>[];

    for (final e in count.entries) {
      if (e.value == max_count) {
        results.add(e.key);
      }
    }

    return results;
  }

  void check(TreeNode? root) {
    if (root == null) return;

    count.update(root.val, (e) {
      max_count = max(max_count, e + 1);
      return e + 1;
    }, ifAbsent: () => 1);

    check(root.left);
    check(root.right);
  }
}
