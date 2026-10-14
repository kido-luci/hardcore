import 'dart:typed_data';

import 'package:collection/collection.dart';

// 353
// ms
// Beats
// 100.00%

class Solution {
  int cutOffTree(List<List<int>> forest) {
    final trees = HeapPriorityQueue<int>();
    for (final i in forest) for (final j in i) if (j > 1) trees.add(j);
    if (trees.isEmpty) return 0;
    final r = forest.length;
    final c = forest.first.length;

    final visited = List.generate(r, (_) => Uint8List(c));
    final queue = QueueList<(int, int, int)>(r * c);

    void add_2_q(int i, int j, int moved) {
      if (i == -1 || i == r || j == -1 || j == c) return;
      if (visited[i][j] == 1) return;
      final val = forest[i][j];
      // print(trees.first);
      if (val == 0) return;
      // if (val == 0 || val > trees.first) return;
      queue.add((i, j, moved));
      visited[i][j] = 1;
    }

    add_2_q(0, 0, 0);

    while (queue.isNotEmpty) {
      var (i, j, moved) = queue.removeFirst();
      if (forest[i][j] == trees.first) {
        trees.removeFirst();

        if (trees.isEmpty) return moved;
        for (var i = 0; i < r; i++) visited[i] = Uint8List(c);
        queue.clear();
      }

      moved++;

      add_2_q(i, j + 1, moved);
      add_2_q(i + 1, j, moved);
      add_2_q(i, j - 1, moved);
      add_2_q(i - 1, j, moved);
    }

    return -1;
  }
}

// void main(List<String> args) {
//   print(
//     Solution().cutOffTree([
//       [54581641, 64080174, 24346381, 69107959],
//       [86374198, 61363882, 68783324, 79706116],
//       [668150, 92178815, 89819108, 94701471],
//       [83920491, 22724204, 46281641, 47531096],
//       [89078499, 18904913, 25462145, 60813308],
//     ]),
//   );
// }
