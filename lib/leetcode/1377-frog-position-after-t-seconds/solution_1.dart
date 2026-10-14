import 'dart:typed_data';

// 3
// ms
// Beats
// 100.00%

class Solution {
  double frogPosition(int n, List<List<int>> edges, int t, int target) {
    final nodes = List.generate(n + 1, (_) => <int>[]);
    for (final e in edges) {
      nodes[e[0]].add(e[1]);
      nodes[e[1]].add(e[0]);
    }
    final visited = Uint8List(n + 1);

    double? dfs(int node, int moved) {
      if (moved > t) return node == target ? 0 : null;
      int child_count = 0;
      double? rate = node == target ? 1 : null;
      for (final e in nodes[node]) {
        if (visited[e] == 1) continue;
        visited[e] = 1;
        child_count++;
        rate ??= dfs(e, moved + 1);
      }

      if (node == target) {
        return child_count == 0 || moved == t ? 1 : 0;
      }

      return rate != null ? rate * (1 / child_count) : null;
    }

    visited[1] = 1;
    return dfs(1, 0) ?? 0;
  }
}

void main(List<String> args) {
  print(
    Solution().frogPosition(
      9,
      [
        [2, 1],
        [3, 1],
        [4, 2],
        [5, 3],
        [6, 5],
        [7, 4],
        [8, 7],
        [9, 7],
      ],
      1,
      8,
    ),
  );
  // print(
  //   Solution().frogPosition(
  //     7,
  //     [
  //       [1, 2],
  //       [1, 3],
  //       [1, 7],
  //       [2, 4],
  //       [2, 6],
  //       [3, 5],
  //     ],
  //     2,
  //     4,
  //   ),
  // );
}
