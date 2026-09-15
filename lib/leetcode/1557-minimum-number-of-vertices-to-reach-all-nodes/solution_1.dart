// 3
// ms
// Beats
// 100.00%

import 'dart:typed_data';

class Solution {
  List<int> findSmallestSetOfVertices(int n, List<List<int>> edges) {
    final has_parent = Uint8List(n);

    for (final edge in edges) has_parent[edge[1]] = 1;

    final result = <int>[];

    for (var i = 0; i < n; i++) {
      if (has_parent[i] == 0) result.add(i);
    }

    return result;
  }
}

// 31
// ms
// Beats
// -%
//
// class Solution {
//   List<int> findSmallestSetOfVertices(int n, List<List<int>> edges) {
//     final child_parent = List.filled(n, -1);
//     final parent_childs = List.generate(n, (_) => <int>[]);

//     for (final edge in edges) {
//       final parent = child_parent[edge[0]];

//       if (parent == -1) {
//         child_parent[edge[1]] = edge[0];
//         parent_childs[edge[0]].add(edge[1]);

//         for (final e in parent_childs[edge[1]]) {
//           child_parent[e] = edge[0];
//           parent_childs[edge[0]].add(e);
//         }

//         parent_childs[edge[1]].clear();
//       } else {
//         child_parent[edge[1]] = parent;
//         parent_childs[parent].add(edge[1]);
//       }
//     }

//     final result = <int>[];

//     for (var i = 0; i < n; i++) {
//       if (child_parent[i] == -1) result.add(i);
//     }

//     return result;
//   }
// }
