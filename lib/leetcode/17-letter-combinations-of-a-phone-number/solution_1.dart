// 0
// ms
// Beats
// 100.00%

class Solution {
  final map = <List<String>>[
    [],
    [],
    ['a', 'b', 'c'],
    ['d', 'e', 'f'],
    ['g', 'h', 'i'],
    ['j', 'k', 'l'],
    ['m', 'n', 'o'],
    ['p', 'q', 'r', 's'],
    ['t', 'u', 'v'],
    ['w', 'x', 'y', 'z'],
  ];

  List<String> letterCombinations(String digits) {
    if (digits.isEmpty) return [];
    if (digits.length == 1) return map[digits.codeUnitAt(0) - 48];

    final childs = letterCombinations(digits.substring(1));

    final result = <String>[];

    // print(map[digits.codeUnitAt(0) - 48]);

    for (final root in map[digits.codeUnitAt(0) - 48]) {
      for (final child in childs) {
        result.add(root + child);
      }
    }

    return result;
  }
}
