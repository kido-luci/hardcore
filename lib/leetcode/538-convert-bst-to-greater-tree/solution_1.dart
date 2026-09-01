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
  TreeNode? convertBST(TreeNode? root) {
    if (root == null) return null;

    int? impl(TreeNode? root, [int add = 0]) {
      if (root == null) return null;

      final right = impl(root.right, add);

      root.val += (right ?? add);

      //   print(root.val);

      final left = impl(root.left, root.val);

      return left ?? root.val;
    }

    impl(root);

    return root;
  }
}
