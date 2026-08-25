// * Definition for a binary tree node.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 55
// ms
// Beats
// 100.00%

class Solution {
  TreeNode? createBinaryTree(List<List<int>> descriptions) {
    final map = <int, (TreeNode, bool)>{};

    for (final e in descriptions) {
      final root = map[e[0]] ?? (TreeNode(e[0]), false);
      final child = map[e[1]]?.$1 ?? TreeNode(e[1]);

      if (e[2] == 1) {
        root.$1.left = child;
      } else {
        root.$1.right = child;
      }

      map[e[0]] = root;
      map[e[1]] = (child, true);
    }

    for (final e in map.values) {
      if (!e.$2) {
        return e.$1;
      }
    }

    return null;
  }
}
