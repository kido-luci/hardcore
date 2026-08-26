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
  final tr1_val = <int>[];
  int i = 0;

  bool leafSimilar(TreeNode? root1, TreeNode? root2) {
    takeLeaf1(root1);
    // print(tree1_val);

    return checkLeaf2(root2) && i == tr1_val.length;
  }

  void takeLeaf1(TreeNode? r) {
    if (r == null) return;
    if (r.left == null && r.right == null) tr1_val.add(r.val);

    takeLeaf1(r.left);
    takeLeaf1(r.right);
  }

  bool checkLeaf2(TreeNode? r) {
    if (r == null) return true;
    if (r.left == null && r.right == null) {
      return i < tr1_val.length ? r.val == tr1_val[i++] : false;
    }

    return checkLeaf2(r.left) && checkLeaf2(r.right);
  }
}
