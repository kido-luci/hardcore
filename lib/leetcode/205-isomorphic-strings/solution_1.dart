import 'dart:typed_data';

// 1
// ms
// Beats
// 100.00%

class Solution {
  bool isIsomorphic(String s, String t) {
    final map_s = Uint8List(128);
    final map_t = Uint8List(128);
    for (var i = 0; i < s.length; i++) {
      final s_c = s.codeUnitAt(i);
      final m_s = map_s[s_c];

      final t_c = t.codeUnitAt(i);

      if (m_s == 0) {
        if (map_t[t_c] != 0) return false;

        map_s[s_c] = t_c + 1;
        map_t[t_c] = 1;
      } else if (m_s != t_c + 1)
        return false;
    }

    return true;
  }
}
