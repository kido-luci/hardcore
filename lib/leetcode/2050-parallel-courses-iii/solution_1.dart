import 'dart:collection';
import 'dart:math';

// 41
// ms
// Beats
// 100.00%

class Solution {
  int minimumTime(int n, List<List<int>> relations, List<int> time) {
    final paths = List.generate(n + 1, (_) => <int>[]);
    final depends = List.filled(n + 1, 0);

    for (final e in relations) {
      paths[e[0]].add(e[1]);
      depends[e[1]]++;
    }

    // print(paths);
    // print(depends);

    var queue = ListQueue<(int, int)>(n);
    final cal = List.filled(n + 1, 0);

    for (var i = 1; i <= n; i++) if (depends[i] == 0) queue.add((i, time[i - 1]));

    int taked = 0;

    while (queue.isNotEmpty) {
      final (node, node_time) = queue.removeFirst();

      taked = max(taked, node_time);
      // print('$node: ${time[node - 1]}');

      for (final e in paths[node]) {
        cal[e] = max(cal[e], node_time);

        if (--depends[e] <= 0) queue.add((e, cal[e] + time[e - 1]));
      }
    }

    return taked;
  }
}

void main(List<String> args) {
  print(
    Solution().minimumTime(
      3,
      [
        [1, 3],
        [2, 3],
      ],
      [3, 2, 5],
    ),
  );
}
