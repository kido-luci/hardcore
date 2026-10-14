import 'dart:collection';
import 'dart:typed_data';

// 41
// ms
// Beats
// 28.57%
class Solution {
  int coinChange(List<int> coins, int amount) {
    if (amount == 0) return 0;

    final mem = Uint8List(amount + 1);

    final queue = ListQueue<(int, int)>(mem.length);

    for (final e in coins) {
      if (e > amount) continue;
      if (e == amount) return 1;
      queue.add((e, 1));
      mem[e] = 1;
    }

    while (queue.isNotEmpty) {
      var (sum, count) = queue.removeFirst();

      count++;

      for (final e in coins) {
        final next_sum = e + sum;
        if (next_sum > amount) continue;
        if (next_sum == amount) return count;
        if (mem[next_sum] == 1) continue;
        queue.add((next_sum, count));
        mem[next_sum] = 1;
      }
    }

    return -1;
  }
}

void main(List<String> args) {
  print(Solution().coinChange([1, 2, 5], 100));
}
