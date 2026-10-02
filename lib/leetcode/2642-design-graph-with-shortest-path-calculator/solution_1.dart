import 'dart:typed_data';

import 'package:collection/collection.dart';

// 137
// ms
// Beats
// 100.00%

class Graph {
  late final List<List<(int, int)>> paths;
  late final int n;

  Graph(int n, List<List<int>> edges) {
    paths = List.generate(n, (i) => <(int, int)>[]);
    for (final e in edges) {
      paths[e[0]].add((e[1], e[2]));
    }
    this.n = n;
  }

  void addEdge(List<int> edge) {
    paths[edge[0]].add((edge[1], edge[2]));
  }

  int shortestPath(int node1, int node2) {
    final heap = HeapPriorityQueue<(int, int)>((a, b) => a.$2.compareTo(b.$2));
    final visited = Uint8List(n);

    heap.add((node1, 0));

    while (heap.isNotEmpty) {
      final (to, moved) = heap.removeFirst();
      if (visited[to] == 1) continue;
      if (to == node2) return moved;
      visited[to] = 1;

      for (final (next, cost) in paths[to]) {
        if (visited[next] == 0) heap.add((next, cost + moved));
      }
    }

    return -1;
  }
}
