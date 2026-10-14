import 'package:collection/collection.dart';

// 93
// ms
// Beats
// 100.00%

class Solution {
  int scheduleCourse(List<List<int>> courses) {
    int taked = 0;
    int complete = 0;
    courses.sort((a, b) => a[1].compareTo(b[1]));

    final heap = HeapPriorityQueue<int>((a, b) => b.compareTo(a));

    for (final e in courses) {
      final remain = e[1] - taked;
      if (e[0] <= remain) {
        complete++;
        taked += e[0];
        heap.add(e[0]);
      } else if (heap.isNotEmpty && e[0] < heap.first) {
        taked -= (heap.removeFirst() - e[0]);
        heap.add(e[0]);
      }
    }

    return complete;
  }
}

void main(List<String> args) {
  print(
    Solution().scheduleCourse([
      [100, 200],
      [200, 1300],
      [1000, 1250],
      [2000, 3200],
    ]),
  );
  print(
    Solution().scheduleCourse([
      [1, 2],
    ]),
  );
  print(
    Solution().scheduleCourse([
      [3, 2],
      [4, 3],
    ]),
  );
  print(
    Solution().scheduleCourse([
      [5, 5],
      [1, 6],
      [1, 6],
      [1, 6],
      [1, 6],
    ]),
  );
}
