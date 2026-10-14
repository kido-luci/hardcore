import 'dart:typed_data';

// 66
// ms
// Beats
// 100.00%

class Solution {
  List<int> countSubTrees(int n, List<List<int>> edges, String labels) {
    final nodes = List.generate(n, (_) => <int>[]);
    final counts = List<Uint32List?>.filled(n, null);
    final result = Uint32List(n);
    for (final e in edges) {
      nodes[e[0]].add(e[1]);
      nodes[e[1]].add(e[0]);
    }

    final stack = <(int, int)>[(0, 0)];

    while (stack.isNotEmpty) {
      final (node, parent) = stack.last;
      final sym = labels.codeUnits[node] - 97;

      final count = counts[node];

      if (count == null) {
        counts[node] = Uint32List(26)..[sym] = 1;

        for (final e in nodes[node]) if (counts[e] == null) stack.add((e, node));
      } else {
        result[node] = count[sym];
        final p_count = counts[parent]!;

        for (var i = 0; i < 26; i++) p_count[i] += count[i];

        stack.removeLast();
      }
    }

    return result;
  }
}
