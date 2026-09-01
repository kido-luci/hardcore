import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 3
// ms
// Beats
// 100.00%

class Solution {
  int longestUnivaluePath(TreeNode? root) {
    if (root == null) return 0;

    int longest = 0;

    int impl(TreeNode? root, int val) {
      if (root == null) return 0;

      // print((root.val, val));

      final left = impl(root.left, root.val);
      final right = impl(root.right, root.val);

      longest = max(longest, left + right);

      return root.val == val ? 1 + max(left, right) : 0;
    }

    impl(root, root.val + 1);

    return longest;
  }
}
