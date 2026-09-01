import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 5
// ms
// Beats
// 100.00%

class Solution {
  int widthOfBinaryTree(TreeNode? root) {
    if (root == null) return 0;

    var queue = <dynamic>[root];

    var longest = 1;

    while (queue.isNotEmpty) {
      final new_q = <dynamic>[];
      bool isStart = true;
      int count = 0;
      int width = 0;

      void add_2_q(TreeNode? r) {
        if (r != null) {
          if (isStart) {
            isStart = !isStart;
            count = 0;
            width = 1;
          } else {
            width += count + 1;

            if (count != 0) {
              new_q.add(count);
              count = 0;
            }
          }

          new_q.add(r);
        } else {
          count++;
        }
      }

      for (final e in queue) {
        if (e is int) {
          count += e * 2;
        } else {
          add_2_q(e?.left);
          add_2_q(e?.right);
        }
      }

      // print(new_q);

      if (width == 0) break;

      longest = max(longest, width);

      queue = new_q;
    }

    return longest;
  }
}
