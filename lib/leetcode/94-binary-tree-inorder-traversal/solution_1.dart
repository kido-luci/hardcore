// * Definition for a binary tree node.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 1
// ms
// Beats
// 25.81%
// class Solution {
//   List<int> inorderTraversal(TreeNode? root) {
//     if (root == null) return [];

//     return [
//       ...inorderTraversal(root.left),
//       root.val,
//       ...inorderTraversal(root.right),
//     ];
//   }
// }
//

// 0
// ms
// Beats
// 100.00%

class Solution {
  List<int> inorderTraversal(TreeNode? root) {
    final result = <int>[];
    final leftStacks = <TreeNode>[];

    while (root != null || leftStacks.isNotEmpty) {
      while (root != null) {
        leftStacks.add(root);
        root = root.left;
      }

      final current = leftStacks.removeLast();

      result.add(current.val);

      root = current.right;
    }

    return result;
  }
}
