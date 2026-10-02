import 'package:collection/collection.dart';

// 59
// ms
// Beats
// 100.00%

class Solution {
  double maxProbability(
    int n,
    List<List<int>> edges,
    List<double> succProb,
    int start_node,
    int end_node,
  ) {
    final paths = List.generate(n, (_) => <(int, double)>[]);
    for (var i = 0; i < edges.length; i++) {
      paths[edges[i][0]].add((edges[i][1], succProb[i]));
      paths[edges[i][1]].add((edges[i][0], succProb[i]));
    }
    final visted = List<double?>.filled(n, null);
    final heap = HeapPriorityQueue<(int, double)>((b, a) => a.$2.compareTo(b.$2));
    heap.add((start_node, 1));
    visted[start_node] = 1;

    while (heap.isNotEmpty) {
      final (node, rate) = heap.removeFirst();
      final cached = visted[node];
      if (cached != null && rate < cached) continue;
      if (node == end_node) return rate;

      for (var (next_node, next_rate) in paths[node]) {
        next_rate *= rate;
        final cached = visted[next_node];
        if (cached != null && cached >= next_rate) continue;
        visted[next_node] = next_rate;
        heap.add((next_node, next_rate));
      }
    }

    return 0;
  }
}
