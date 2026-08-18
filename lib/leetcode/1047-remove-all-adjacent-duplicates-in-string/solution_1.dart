// 9
// ms
// Beats
// 100.00%

class Solution {
  String removeDuplicates(String s) {
    final stack = <int>[];

    for (final e in s.codeUnits) {
      if (e == stack.lastOrNull) {
        stack.removeLast();
      } else {
        stack.add(e);
      }
    }

    return String.fromCharCodes(stack);
  }
}
