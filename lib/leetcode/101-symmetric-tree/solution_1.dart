class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 1
// ms
// Beats
// 24.39%
class Solution {
  bool isSymmetric(TreeNode? root) {
    if (root == null) return true;

    var q_l = <TreeNode>[if (root.left != null) root.left!];
    var q_r = <TreeNode>[if (root.right != null) root.right!];

    if (q_l.length != q_r.length) return false;

    do {
      var n_ql = <TreeNode>[];
      var n_qr = <TreeNode>[];

      // print((q_l.map((e) => e.val), q_r.map((e) => e.val)));

      for (var i = 0; i < q_l.length; i++) {
        if (q_l[i].val != q_r[i].val) return false;

        if (q_l[i].left != null) n_ql.add(q_l[i].left!);
        if (q_r[i].right != null) n_qr.add(q_r[i].right!);

        if (n_ql.length != n_qr.length) return false;

        if (q_l[i].right != null) n_ql.add(q_l[i].right!);
        if (q_r[i].left != null) n_qr.add(q_r[i].left!);

        if (n_ql.length != n_qr.length) return false;
      }

      q_l = n_ql;
      q_r = n_qr;
    } while (q_l.isNotEmpty);

    return true;
  }
}
