// 5ms beats 54.26%
class Solution {
  bool isValid(String s) {
    final openStack = <int>[];

    // () = 40 - 41
    // {} = 123 - 125
    // [] = 91 - 93
    //
    final mapBracket = {41: 40, 125: 123, 93: 91};

    for (var e in s.codeUnits) {
      if (e == 40 || e == 123 || e == 91) {
        // open bracket => add to stack
        openStack.add(e);
      } else {
        if (openStack.isEmpty) return false;

        // try compare with the map bracket
        if (mapBracket[e] != openStack.removeLast()) return false;
      }
    }

    return openStack.isEmpty;
  }
}
