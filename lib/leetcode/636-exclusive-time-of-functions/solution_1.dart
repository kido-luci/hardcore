// 9
// ms
// Beats
// 100.00%

class Solution {
  List<int> exclusiveTime(int n, List<String> logs) {
    final func = List.filled(n, 0);
    final stack = <int>[];

    int last = 0;

    for (final e in logs) {
      final log = e.split(':');
      final id = int.parse(log[0]), status = log[1], time = int.parse(log[2]);

      if (status == 'start') {
        if (stack.isNotEmpty) func[stack.last] += (time - last);

        stack.add(id);
        last = time;
      } else {
        func[stack.removeLast()] += (time - last) + 1;
        last = time + 1;
      }
    }

    return func;
  }
}
