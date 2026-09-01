// 4
// ms
// Beats
// -%
class Solution {
  bool hasMatch(String s, String p) {
    final cds = <String>[];
    var remain = 0;
    for (final e in p.split('*')) {
      if (e.isNotEmpty) {
        cds.add(e);
        remain += e.length;
      }
    }

    var s_i = 0;
    var s_len = s.length;

    bool check(String c) {
      while (s_len - s_i >= c.length) {
        bool isValid = true;

        for (var i = 0; i < c.length; i++) {
          if (s[s_i + i] != c[i]) {
            isValid = false;
            break;
          }
        }

        if (isValid) {
          remain -= c.length;
          s_i += c.length;
          return true;
        }

        s_i++;
      }

      return false;
    }

    for (final c in cds) {
      // print(s.substring(s_i));
      if (s_len - s_i < remain || !check(c)) return false;
    }

    return true;
  }
}

void main(List<String> args) {
  print(Solution().hasMatch('"ckckkk"', '"ck*kc"'));
}
