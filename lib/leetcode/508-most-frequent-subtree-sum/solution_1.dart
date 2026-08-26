import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 12
// ms
// Beats
// 100.00%

class Solution {
  List<int> findFrequentTreeSum(TreeNode? root) {
    final counts = <int, int>{};

    var maxFrequent = 1;

    countSum(
      root,
      (sum) => counts.update(sum, (e) {
        maxFrequent = max(maxFrequent, e + 1);
        return e + 1;
      }, ifAbsent: () => 1),
    );

    final result = <int>[];

    for (final e in counts.entries) {
      if (e.value == maxFrequent) {
        result.add(e.key);
      }
    }

    return result;
  }

  int countSum(TreeNode? root, void Function(int sum) sumChild) {
    if (root == null) return 0;

    final left = countSum(root.left, sumChild);
    final right = countSum(root.right, sumChild);
    final sum = root.val + left + right;

    // print((root.val, left, right));

    sumChild(sum);

    return sum;
  }
}
