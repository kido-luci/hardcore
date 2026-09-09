import 'dart:typed_data';

// 0
// ms
// Beats
// 100.00%

class Solution {
  List<String> findAndReplacePattern(List<String> words, String pattern) {
    final result = <String>[];

    for (final w in words) {
      final map_s = Uint8List(26);
      final map_p = Uint8List(26);

      bool valid = true;

      for (var i = 0; i < w.length; i++) {
        final w_c = w.codeUnitAt(i) - 97;
        final m_w = map_s[w_c];

        final p_c = pattern.codeUnitAt(i) - 97;

        if (m_w == 0) {
          if (map_p[p_c] != 0) {
            valid = false;
            break;
          }

          map_s[w_c] = p_c + 1;
          map_p[p_c] = 1;
        } else if (m_w != p_c + 1) {
          valid = false;
          break;
        }
      }

      if (valid) result.add(w);
    }

    return result;
  }
}
