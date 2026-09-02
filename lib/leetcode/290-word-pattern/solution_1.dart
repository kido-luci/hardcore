// 0
// ms
// Beats
// 100.00%

class Solution {
  bool wordPattern(String pattern, String s) {
    final s_slip = s.split(' ');

    if (s_slip.length != pattern.length) return false;

    var k1 = 0;
    final s_k = <String, int>{};

    final s_b = List.filled(s.length, 0);
    for (var i = 0; i < s_slip.length; i++) {
      s_b[i] = s_k[s_slip[i]] ?? (s_k[s_slip[i]] = k1++);
    }

    final p_k = List<int?>.filled(26, null);
    var k2 = 0;
    for (var i = 0; i < pattern.length; i++) {
      final d = pattern.codeUnitAt(i) - 97;
      if ((p_k[d] ?? (p_k[d] = k2++)) != s_b[i]) return false;
    }

    return true;
  }
}

// class Solution {
//   bool wordPattern(String pattern, String s) {
//     final s_slip = s.split(' ');

//     if (s_slip.length != pattern.length) return false;

//     final s_map = <String, int>{};

//     for (final e in s_slip) {
//       s_map.update(e, (c) => c + 1, ifAbsent: () => 1);
//     }

//     if (s_map.length > 26) return false;

//     final count_s = <int, int>{};

//     for (final e in s_map.values) {
//       count_s.update(e, (c) => c + 1, ifAbsent: () => 1);
//     }

//     final c_c = List.filled(26, 0);

//     for (final e in pattern.codeUnits) {
//       c_c[e - 97]++;
//     }

//     final count_p = <int, int>{};

//     for (final e in c_c) {
//       if (e == 0) continue;
//       count_p.update(e, (c) => c + 1, ifAbsent: () => 1);
//     }

//     if (count_p.length != count_s.length) return false;

//     for (final e in count_p.entries) {
//       if (count_s[e.key] != e.value) return false;
//     }

//     return true;
//   }
// }

void main(List<String> args) {
  print(Solution().wordPattern("aba", "dog cat cat"));
}
