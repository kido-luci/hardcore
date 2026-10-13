import 'dart:collection';

// 4
// ms
// Beats
// 100.00%

class Solution {
  List<int> findOrder(int numCourses, List<List<int>> prerequisites) {
    final results = <int>[];
    final paths = List.generate(numCourses, (_) => <int>[]);
    final depends = List.filled(numCourses, 0);

    for (final e in prerequisites) {
      paths[e[1]].add(e[0]);
      depends[e[0]]++;
    }

    final queue = ListQueue<int>(numCourses);
    for (var i = 0; i < numCourses; i++) if (depends[i] == 0) queue.add(i);

    int passed = 0;

    while (queue.isNotEmpty) {
      final node = queue.removeFirst();
      results.add(node);
      passed++;
      for (final child in paths[node]) {
        if (--depends[child] == 0) queue.add(child);
      }
    }

    return passed == numCourses ? results : [];
  }
}
