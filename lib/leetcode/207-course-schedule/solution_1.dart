import 'package:collection/collection.dart';

// 6
// ms
// Beats
// 71.43%

class Solution {
  bool canFinish(int numCourses, List<List<int>> prerequisites) {
    final paths = List.generate(numCourses, (_) => <int>[]);
    final depends = List.filled(numCourses, 0);

    int passed = 0;

    for (final e in prerequisites) {
      paths[e[1]].add(e[0]);
      depends[e[0]]++;
    }

    final queue = QueueList<int>();

    for (var i = 0; i < numCourses; i++) if (depends[i] == 0) queue.add(i);

    while (queue.isNotEmpty) {
      final node = queue.removeFirst();
      passed++;

      for (final child in paths[node]) if (--depends[child] == 0) queue.add(child);
    }

    return passed == numCourses;
  }
}

void main(List<String> args) {
  print(
    Solution().canFinish(2, [
      [1, 0],
    ]),
  );
  print(
    Solution().canFinish(2, [
      [1, 0],
      [0, 1],
    ]),
  );
  print(
    Solution().canFinish(6, [
      [1, 0],
      [2, 0],
      [1, 3],
      [4, 5],
    ]),
  );
}
