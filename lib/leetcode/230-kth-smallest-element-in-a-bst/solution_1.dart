class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 1
// ms
// Beats
// 80.00%

class Solution {
  int kthSmallest(TreeNode? root, int k) {
    if (root == null) return k;

    int? result;

    bool count(TreeNode? root) {
      if (root == null) return false;

      final left = count(root.left);

      if (left) return false;

      k--;

      if (k == 0) {
        result = root.val;
        return true;
      }

      return count(root.right);
    }

    count(root);

    return result ?? k;
  }
}
