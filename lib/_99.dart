import 'package:hardcore/model/binary_tree.dart';

class Solution {
  void recoverTree(TreeNode? root) {
    (TreeNode, TreeNode)? impl(TreeNode root) {
      var c_min = root, c_max = root;

      final to_check = List.filled(3, root);

      if (root.left != null) {
        final l = impl(root.left!);

        if (l == null) return null;

        c_min = l.$1;
        to_check[0] = l.$2;
      }

      if (root.right != null) {
        final r = impl(root.right!);

        if (r == null) return null;

        c_max = r.$2;
        to_check[2] = r.$1;
      }

      final sort = to_check.map((e) => e.val).toList()..sort();

      print(sort);

      bool isValid = true;

      for (var i = 0; i < 3; i++) {
        print(sort[i]);

        if (to_check[i].val != sort[i]) {
          isValid = false;
          to_check[i].val = sort[i];
        }
      }

      if (!isValid) return null;

      return (c_min, c_max);
    }

    impl(root!);
  }
}

void main(List<String> args) {
  Solution().recoverTree(TreeNode.fromList([1, 3, null, null, 2]));
}
