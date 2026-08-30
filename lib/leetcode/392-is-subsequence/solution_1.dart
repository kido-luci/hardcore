// 0
// ms
// Beats
// 100.00%

class Solution {
  bool isSubsequence(String s, String t) {
    if (s.isEmpty) return true;

    var j = 0;
    final t_len = t.length;
    final s_len = s.length;

    for (var i = 0; i < t_len; i++) {
      if (t_len - i < s_len - j) break;

      if (t[i] == s[j]) {
        if (++j == s_len) break;
      }
    }

    return j == s_len;
  }
}
