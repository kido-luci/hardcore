import 'package:collection/collection.dart';

// 6
// ms
// Beats
// 60.00%

class Solution {
  int timeRequiredToBuy(List<int> tickets, int k) {
    int time = 0;
    final queue = QueueList<(int, bool)>();
    queue.addAll(List.generate(tickets.length, (i) => (tickets[i], i == k)));

    while (tickets[k] > 0) {
      time++;

      var (val, is_k) = queue.removeFirst();
      val--;

      if (val > 0)
        queue.add((val, is_k));
      else if (is_k)
        break;
    }

    return time;
  }
}
