class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 2
// ms
// Beats
// -%

class Solution {
  int sumEvenGrandparent(TreeNode? root) {
    if (root == null) return 0;

    int sum = 0;

    void check(TreeNode? root, bool parent, bool g_parent) {
      if (root == null) return;

      if (g_parent) sum += root.val;

      check(root.left, root.val.isEven, parent);
      check(root.right, root.val.isEven, parent);
    }

    check(root, false, false);

    return sum;
  }
}
