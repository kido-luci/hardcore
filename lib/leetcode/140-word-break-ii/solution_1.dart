// 3
// ms
// Beats
// 100.00%

class Solution {
  List<String> wordBreak(String s, List<String> wordDict) {
    final set = wordDict.toSet();

    final mem = <int, List<String>>{};

    final s_len = s.length;

    List<String> get_ways(int start) {
      if (mem[start] != null) return mem[start]!;

      final ways = <String>[];

      for (var i = start + 1; i <= s_len; i++) {
        final sub = s.substring(start, i);
        if (set.contains(sub)) ways.add(sub);
      }

      return mem[start] = ways;
    }

    final result = <String>[];

    final can = <String>[];

    void dfs(int start) {
      final ways = get_ways(start);

      for (final w in ways) {
        can.add(w);

        final next = start + w.length;

        if (next == s_len) {
          result.add(can.join(' '));
        } else {
          dfs(next);
        }

        can.removeLast();
      }
    }

    dfs(0);

    return result;
  }
}
