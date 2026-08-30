// 40
// ms
// Beats
// 100.00%

class Solution {
  int numMatchingSubseq(String s, List<String> words) {
    var macth = 0;

    int c_2_i(int c) => c - 97;
    int w_2_i(String w, [int i = 0]) => c_2_i(w.codeUnitAt(i));

    final cs = <String, (int, int)>{};
    for (var i = 0; i < words.length; i++) {
      cs.update(words[i], (v) => (v.$1, v.$2 + 1), ifAbsent: () => (i, 1));
    }

    final map = List<List<(int, int, int)>>.generate(
      26,
      (_) => <(int, int, int)>[],
      growable: false,
    );

    for (final (i, c) in cs.values) {
      map[w_2_i(words[i])].add((i, 0, c));
    }

    for (final s_c in s.codeUnits) {
      final s_i = c_2_i(s_c);
      final ws = map[s_i];
      map[s_i] = <(int, int, int)>[];

      if (ws.isEmpty) continue;

      for (final (w_i, c_i, dup) in ws) {
        final w = words[w_i];

        if (c_i + 1 == w.length) {
          macth += dup;
        } else {
          final next = (w_i, c_i + 1, dup);
          final next_i = w_2_i(w, next.$2);

          map[next_i].add(next);
        }
      }
    }

    return macth;
  }
}

main() {
  print(
    Solution().numMatchingSubseq("btovxbkumc", [
      "btovxbku",
      "to",
      "zueoxxxjme",
      "yjkclbkbtl",
    ]),
  );
}

// TIME OUT :)
// class Solution {
//   int numMatchingSubseq(String s, List<String> words) {
//     var macth = 0;

//     final counts = words.map((e) {
//       if (e.isNotEmpty) return 0;

//       macth++;
//       return -1;
//     }).toList();

//     for (final e in s.codeUnits) {
//       for (var j = 0; j < words.length; j++) {
//         if (counts[j] == -1) continue;

//         if (words[j].codeUnitAt(counts[j]) == e) {
//           if (++counts[j] == words[j].length) {
//             counts[j] = -1;
//             macth++;
//           }
//         }
//       }
//     }

//     return macth;
//   }
// }
