// 3ms - beast 85.65%
class Solution {
  bool isValid(String s) {
    final openStack = <int>[];

    // () = 40 - 41
    // {} = 123 - 125
    // [] = 91 - 93
    //
    for (var e in s.codeUnits) {
      if (e == 40 || e == 123 || e == 91) {
        // open bracket => add to stack
        openStack.add(e);
      } else {
        if (openStack.isEmpty) return false;

        // try use switch
        switch (e) {
          case 41:
            if (openStack.removeLast() != 40) return false;
            break;
          case 125:
            if (openStack.removeLast() != 123) return false;
            break;
          case 93:
            if (openStack.removeLast() != 91) return false;
            break;
        }
      }
    }

    return openStack.isEmpty;
  }
}
