// 8
// ms
// Beats
// -%
class Solution {
  late String _s;

  bool isMatch(String s, String p) {
    _s = s;
    final s_len = s.length;
    final p_len = p.length;

    var (cds, remain) = get_conditions(p);

    if (remain > s_len) return false;

    if (cds.isEmpty)
      return (p.isEmpty && s.isEmpty) || (p.isNotEmpty && p[0] == '*');
    if (p[0] != '*' &&
        p[p_len - 1] != '*' &&
        cds.length == 1 &&
        s_len != remain)
      return false;

    int s_str = 0;
    int s_end = s_len - 1;

    int c_str = 0;
    int c_end = cds.length - 1;

    if (p[0] != '*') {
      final c = cds[0];
      final v_str = ck(s_str, s_str + c.length - 1, c);
      if (v_str == null) return false;
      if (++c_str > c_end) return true;
      s_str = v_str + c.length;
      remain -= c.length;
    }

    if (p[p_len - 1] != '*') {
      final c = cds.last;
      final v_str = ck(s_end - c.length + 1, s_end, c);
      if (v_str == null) return false;
      if (--c_end < c_str) return true;
      s_end = s_end - c.length;
      remain -= c.length;
    }

    if (s_end - s_str < remain - 1) return false;

    for (var i = c_str; i <= c_end; i++) {
      final c = cds[i];

      if (s_end - s_str < remain - 1) return false;

      final v_str = ck(s_str, s_end, c);

      if (v_str == null) break;

      s_str = v_str + c.length;
      remain -= c.length;
    }

    return remain == 0;
  }

  (List<String>, int) get_conditions(String p) {
    final conditions = <String>[];
    var char_len = 0;

    for (var e in p.split('*')) {
      if (e.isEmpty) continue;
      conditions.add(e);
      char_len += e.length;
    }

    return (conditions, char_len);
  }

  int? ck(int start, int end, String c) {
    final chk_len = c.length;

    // print((_s.substring(start, end + 1), condition));

    while (end - start >= chk_len - 1) {
      bool isValid = true;

      for (var i = 0; i < chk_len; i++) {
        if (c[i] != '?' && c[i] != _s[start + i]) {
          isValid = false;
          break;
        }
      }

      if (isValid) return start;

      start++;
    }

    return null;
  }
}

void main() {
  print('----');
  print('1-> true');
  print(Solution().isMatch("aaaa", "***a"));
  print('----');
  print('2-> false');
  print(Solution().isMatch("acdcb", "a*c?b"));
  print('----');
  print('3-> true');
  print(Solution().isMatch("adceb", "*a*b"));
  print('----');
  print('4-> true');
  print(Solution().isMatch("", "******"));
  print('----');
  print('5-> true');
  print(
    Solution().isMatch(
      "aaabbbaabaaaaababaabaaabbabbbbbbbbaabababbabbbaaaaba",
      "*a*******b*",
    ),
  );
  print('----');
  print('6-> false');
  print(Solution().isMatch("aa", "a"));
  print('----');
  print('7-> true');
  print(Solution().isMatch("aa", "*"));
  print('----');
  print('8-> false');
  print(Solution().isMatch("cb", "?a"));
  print('----');
  print('9-> false');
  print(Solution().isMatch("a*******b", "?a"));
  print('----');
  print('10-> ?');
  print(
    Solution().isMatch(
      "abbabaaabbabbaababbabbbbbabbbabbbabaaaaababababbbabababaabbababaabbbbbbaaaabababbbaabbbbaabbbbababababbaabbaababaabbbababababbbbaaabbbbbabaaaabbababbbbaababaabbababbbbbababbbabaaaaaaaabbbbbaabaaababaaaabb",
      "**aa*****ba*a*bb**aa*ab****a*aaaaaa***a*aaaa**bbabb*b*b**aaaaaaaaa*a********ba*bbb***a*ba*bb*bb**a*b*bb",
    ),
  );
  print('----');
  print('11-> true');
  print(Solution().isMatch("aa", "a*"));
  print('----');
  print('12-> true');
  print(Solution().isMatch("abcabczzzde", "*abc???de*"));
  print('----');
  print('13-> false');
  print(Solution().isMatch("ab", "*a"));
  print('----');
  print('14-> false');
  print(Solution().isMatch("a", ""));
  print('----');
  print('15-> true');
  print(Solution().isMatch("hi", "*?"));
  print('----');
  print('-> true');
  print(Solution().isMatch("cab", "*ab"));
  print('----');
  print('-> flase');
  print(Solution().isMatch("aaab", "b**"));
  print('----');
  print('-> flase');
  print(Solution().isMatch("aaab", "b**"));
  print('----');
  print('-> flase');
  print(Solution().isMatch("bbbaab", "a**?***"));
  print('----');
  print('-> true');
  print(Solution().isMatch("abefcdgiescdfimde", "ab*cd?i*de"));

  print('----');
  print('-> true');
  print(Solution().isMatch("c", "*?*"));
}

// void main() {
//   print(Solution().isMatch("acdcb", "a*c?b")); //false
//   print(Solution().isMatch("adceb", "*a*b")); //true
//   print(Solution().isMatch("", "******")); // true
//   print(
//     Solution().isMatch(
//       "aaabbbaabaaaaababaabaaabbabbbbbbbbaabababbabbbaaaaba",
//       "*a*******b*",
//     ),
//   ); // false
// }

// Time Limit Exceeded

// 1710 / 1812
// class Solution {
//   bool isMatch(String s, String p) {
//     // print((s, p));

//     if (p.isEmpty) return s.isEmpty;

//     if (p[0] == '*') {
//       var operator = '';

//       for (var i = 1; i < p.length; i++) {
//         if (p[i] != '*') {
//           operator = p.substring(i);
//           break;
//         }
//       }

//       if (operator.isEmpty) return true;

//       for (var i = 0; i <= s.length; i++) {
//         if (isMatch(s.substring(i), operator)) return true;
//       }

//       return false;
//     }

//     if (s.isEmpty) return p[0] == '*';

//     if (p[0] != '?' && p[0] != s[0]) return false;

//     return isMatch(s.substring(1), p.substring(1));
//   }
// }
