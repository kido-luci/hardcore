class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 14
// ms
// Beats
// 100.00%

class Solution {
  String tree2str(TreeNode? root) {
    if (root == null) return '';

    final left = tree2str(root.left);
    final right = tree2str(root.right);

    final buffer = StringBuffer(root.val);

    if (left.isNotEmpty) {
      buffer.write('($left)');
    } else if (right.isNotEmpty) {
      buffer.write('()');
    }

    if (right.isNotEmpty) {
      buffer.write('($right)');
    }

    return buffer.toString();
  }
}
