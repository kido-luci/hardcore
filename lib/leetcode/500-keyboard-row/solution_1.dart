// 1
// ms
// Beats
// 100.00%

class Solution {
  List<String> findWords(List<String> words) {
    final map = List.filled(127, -1);
    final keys = ['qwertyuiop', 'asdfghjkl', 'zxcvbnm'];
    for (var i = 0; i < 3; i++) {
      for (final e in keys[i].codeUnits) {
        map[e] = i;
        map[e - 32] = i;
      }
    }

    final result = <String>[];
    for (final e in words) {
      final source = map[e.codeUnits[0]];
      bool valid = true;

      for (var i = 1; i < e.length; i++) {
        if (map[e.codeUnits[i]] != source) {
          valid = false;
          break;
        }
      }

      if (valid) result.add(e);
    }

    return result;
  }
}
