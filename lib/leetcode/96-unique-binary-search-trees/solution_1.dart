// 0
// ms
// Beats
// 100.00%

class Solution {
  int numTrees(int n) {
    if (n <= 2) return n;

    final counts = <int>[1, 1, 2];

    for (var i = 3; i <= n; i++) {
      // print(i);
      // print(counts);

      var count = 0;

      for (var j = 1; j <= i; j++) {
        // print((j - 1, i - j));
        count += counts[j - 1] * counts[i - j];
      }

      counts.add(count);
    }

    return counts.last;
  }
}

void main(List<String> args) {
  print(Solution().numTrees(4));
}
