//Definition for a binary tree node.

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);

  /// Builds a tree from the LeetCode level-order format, where `null` marks a
  /// missing child and the children of a missing node are omitted entirely.
  static TreeNode? fromList(List<int?> iterable) {
    if (iterable.isEmpty || iterable.first == null) return null;

    final root = TreeNode(iterable.first!);
    final queue = <TreeNode>[root];

    var i = 1;
    var head = 0;

    while (head < queue.length && i < iterable.length) {
      final current = queue[head++];

      final l = iterable[i++];
      if (l != null) {
        current.left = TreeNode(l);
        queue.add(current.left!);
      }

      if (i >= iterable.length) break;

      final r = iterable[i++];
      if (r != null) {
        current.right = TreeNode(r);
        queue.add(current.right!);
      }
    }

    return root;
  }
}
