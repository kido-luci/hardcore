import 'dart:math';

// 60
// ms
// Beats
// 33.33%
class Solution {
  int numOfMinutes(int n, int headID, List<int> manager, List<int> informTime) {
    final nodes = List.generate(n, (_) => <int>[]);
    for (var i = 0; i < n; i++) if (manager[i] != -1) nodes[manager[i]].add(i);

    int minutes = 0;

    void dfs(int node, int time) {
      time += informTime[node];
      final child = nodes[node];
      if (child.isEmpty) {
        minutes = max(minutes, time);
        return;
      }

      for (final e in child) {
        // print('$node -> $e');

        dfs(e, time);
      }
    }

    dfs(headID, 0);

    return minutes;
  }
}

void main(List<String> args) {
  print(
    Solution().numOfMinutes(
      15,
      0,
      [-1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6],
      [1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    ),
  );
}
