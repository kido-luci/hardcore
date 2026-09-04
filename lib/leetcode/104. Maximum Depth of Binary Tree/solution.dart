import 'dart:math';

import 'package:hardcore/model/binary_tree.dart';

class Solution {
  int maxDepth(TreeNode? root) {
    if (root == null) return 0;

    return 1 + max(maxDepth(root.left), maxDepth(root.right));
  }
}
