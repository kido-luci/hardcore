import 'dart:typed_data';

// 46
// ms
// Beats
// 100.00%

class Solution {
  int minTime(int n, List<List<int>> edges, List<bool> hasApple) {
    final nodes = List.generate(n, (_) => <int>[]);
    for (final e in edges) {
      nodes[e[0]].add(e[1]);
      nodes[e[1]].add(e[0]);
    }
    final visited = Uint8List(n);

    int time = 0;

    bool dfs(int node) {
      visited[node] = 1;
      bool have_apple = false;

      for (final e in nodes[node]) {
        // print('$node -> $e');

        if (visited[e] == 0 && dfs(e)) {
          time += 2;
          have_apple = true;
        }
      }

      // print('$node: $have_apple');

      return have_apple || hasApple[node];
    }

    dfs(0);

    return time;
  }
}

void main(List<String> args) {
  print(
    Solution().minTime(
      4,
      [
        [0, 2],
        [0, 3],
        [1, 2],
      ],
      [false, true, false, false],
    ),
  );

  // print(
  //   Solution().minTime(
  //     7,
  //     [
  //       [0, 1],
  //       [0, 2],
  //       [1, 4],
  //       [1, 5],
  //       [2, 3],
  //       [2, 6],
  //     ],
  //     [false, false, true, false, true, true, false],
  //   ),
  // );
}
