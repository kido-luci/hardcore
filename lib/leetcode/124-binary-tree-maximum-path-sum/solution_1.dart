import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// 1344
// ms
// Beats
// -%
//
// class Solution {
//   int maxPathSum(TreeNode? root) {
//     if (root == null) return 0;

//     int best = root.val;

//     void check(int val) => best = max(best, val);

//     final lefts = <int>[];
//     final rights = <int>[];

//     void impl(TreeNode root) {
//       check(root.val);

//       lefts.clear();
//       rights.clear();

//       findPaths(root.left, root.val, (path) => lefts.add(path));
//       findPaths(root.right, root.val, (path) => rights.add(path));

//       for (final l in lefts) {
//         check(l);
//       }

//       for (final r in rights) {
//         check(r);

//         for (final l in lefts) {
//           check(l + r - root.val);
//         }
//       }

//       if (root.left != null) {
//         impl(root.left!);
//       }

//       if (root.right != null) {
//         impl(root.right!);
//       }
//     }

//     impl(root);

//     return best;
//   }

//   void findPaths(TreeNode? root, int parent, void Function(int) onFind) {
//     if (root == null) return;

//     final len = root.val + parent;

//     onFind(len);

//     findPaths(root.left, len, onFind);
//     findPaths(root.right, len, onFind);
//   }
// }
//

// 365
// ms
// Beats
// 25.00%
// class Solution {
//   int maxPathSum(TreeNode? root) {
//     if (root == null) return 0;

//     int best = root.val;

//     void check(int val) => best = max(best, val);

//     void impl(TreeNode? root) {
//       if (root == null) return;

//       final left = findPaths(root.left, root.val);
//       final right = findPaths(root.right, root.val);

//       check(root.val);
//       check(left);
//       check(right);
//       check(left + right - root.val);

//       impl(root.left);
//       impl(root.right);
//     }

//     impl(root);

//     return best;
//   }

//   int findPaths(TreeNode? root, int parent) {
//     if (root == null) return parent;

//     final len = root.val + parent;

//     var best_len = len;

//     best_len = max(findPaths(root.left, len), best_len);
//     best_len = max(findPaths(root.right, len), best_len);

//     return best_len;
//   }
// }

// 1
// ms
// Beats
// 100.00%

class Solution {
  int maxPathSum(TreeNode? root) {
    if (root == null) return 0;

    int best = root.val;

    int find_max_path(TreeNode? root) {
      if (root == null) return 0;

      final left = root.val + find_max_path(root.left);
      final right = root.val + find_max_path(root.right);

      // print((root.val, left, right));

      final max_path = max(root.val, max(left, right));

      best = max(best, max(max_path, left + right - root.val));

      return max_path;
    }

    find_max_path(root);

    return best;
  }
}
