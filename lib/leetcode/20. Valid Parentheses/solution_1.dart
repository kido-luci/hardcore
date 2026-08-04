// loop i -> n -1
// when the s[i] is open brackets add it to stack
// when the s[i] is close brackets
//      if last stack element is same type => remove the last from stack
//      else => the input string is invalid
//
// in the end,
//      if the stack is empty,
//          => it mean it every open brackets is closed by it same type in correct order
//      otherwise => the input string is invalid
//
// 2ms beats 95.52%
class Solution {
  bool isValid(String s) {
    final openStack = <int>[];

    // () = 40 - 41
    // {} = 123 - 125
    // [] = 91 - 93

    for (var e in s.codeUnits) {
      if (e == 40 || e == 123 || e == 91) {
        // open bracket => add to stack
        openStack.add(e);
      } else {
        if (openStack.isEmpty) return false;

        // the distance from open and close bracket codeunit should be equal or smaller than 2
        if ((e - openStack.removeLast()).abs() > 2) return false;
      }
    }

    return openStack.isEmpty;
  }
}
