class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 27
// ms
// Beats
// -%
//
//
class Solution {
  bool isSubtree(TreeNode? root, TreeNode? subRoot) {
    if (root == null || subRoot == null) return false;

    if (root.val == subRoot.val && isChild(root, subRoot)) {
      return true;
    }

    if (isSubtree(root.left, subRoot)) {
      return true;
    }

    return isSubtree(root.right, subRoot);
  }

  bool isChild(TreeNode? root, TreeNode? child) {
    if (root == null && child == null) return true;
    if (root?.val != child?.val) return false;

    if (!isChild(root?.left, child?.left)) return false;

    return isChild(root?.right, child?.right);
  }
}
