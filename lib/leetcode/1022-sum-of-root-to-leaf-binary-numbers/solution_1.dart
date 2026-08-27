class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 0
// ms
// Beats
// 100.00%
class Solution {
  int sumRootToLeaf(TreeNode? root) {
    if (root == null) return 0;

    int sum = 0;

    void impl(TreeNode? root, int val) {
      if (root == null) return;
      val = (val * 2) + root.val;

      //   print((root.val, val));

      if (root.left == null && root.right == null) {
        sum += val;
      } else {
        impl(root.left, val);
        impl(root.right, val);
      }
    }

    impl(root, 0);

    return sum;
  }
}
