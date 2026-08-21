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
// 12.50%
//
// class Solution {
//   List<int> preorderTraversal(TreeNode? root) {
//     if (root == null) return [];

//     return [
//       root.val,
//       ...preorderTraversal(root.left),
//       ...preorderTraversal(root.right),
//     ];
//   }
// }

// Follow up: Recursive solution is trivial, could you do it iteratively?
// 0
// ms
// Beats
// 100.00%

class Solution {
  List<int> preorderTraversal(TreeNode? root) {
    final stacks = <TreeNode>[];
    final results = <int>[];

    while (root != null) {
      results.add(root.val);

      if (root.right != null) {
        stacks.add(root.right!);
      }

      root = root.left;

      if (root == null && stacks.isNotEmpty) {
        root = stacks.removeLast();
      }
    }

    return results;
  }
}
