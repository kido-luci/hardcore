// 30
// ms
// Beats
// 83.33%

class Solution {
  int findContentChildren(List<int> g, List<int> s) {
    if (s.isEmpty) return 0;

    int count = 0;
    s.sort();
    g.sort();

    var j = 0;

    for (final e in g) {
      int? find;

      while (j < s.length) {
        if (e <= s[j++]) {
          count++;
          find = j;
          break;
        }
      }

      if (find == null || find == s.length) {
        break;
      }
    }

    return count;
  }
}

void main(List<String> args) {
  print(
    Solution().findContentChildren([10, 9, 8, 7, 10, 9, 8, 7], [10, 9, 8, 7]),
  );
}
