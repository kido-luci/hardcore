import 'dart:typed_data';

import 'package:collection/collection.dart';

// 51
// ms
// Beats
// -%
class Solution {
  int findTheCity(int n, List<List<int>> edges, int distanceThreshold) {
    int min_visited = n + 1;
    int city = -1;

    final paths = List.generate(n, (_) => <(int, int)>[]);
    for (final e in edges) {
      paths[e[0]].add((e[1], e[2]));
      paths[e[1]].add((e[0], e[2]));
    }

    void handler(int node) {
      var vistied_count = 0;
      final visited = Uint8List(n);

      final heap = HeapPriorityQueue<(int, int)>((a, b) => a.$2.compareTo(b.$2));
      heap.add((node, 0));

      while (heap.isNotEmpty) {
        final (to, moved) = heap.removeFirst();
        if (visited[to] == 1) continue;
        if (++vistied_count == n) break;
        visited[to] = 1;

        for (var (next, cost) in paths[to]) {
          if (visited[next] == 1) continue;
          if ((cost += moved) > distanceThreshold) continue;
          heap.add((next, cost));
        }
      }

      if (vistied_count <= min_visited) {
        min_visited = vistied_count;
        city = node;
      }
    }

    for (var i = 0; i < n; i++) handler(i);

    return city;
  }
}
