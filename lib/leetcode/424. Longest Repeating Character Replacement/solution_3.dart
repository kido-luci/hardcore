import 'dart:math';

// more operation, only good for edge case => no diff
//~22ms On_+<=26
class Solution {
  int characterReplacement(String s, int k) {
    var start_window = 0, longest = 0;

    var codeUnits = s.codeUnits;

    // alphabet A->Z = 26chars
    // A = 65 in codeUnit dec -> insert e to list have to minus by 65
    final countList = List.filled(26, 0);

    int shouldCheckFirst = -1;

    for (var i = 0; i < codeUnits.length; i++) {
      countList[codeUnits[i] - 65]++;

      int calWindowLen() => i - start_window + 1;

      bool isValidWindow() {
        final windowLen = calWindowLen();

        // more operation, only good for edge case => no diff
        if (shouldCheckFirst > -1 &&
            countList[shouldCheckFirst] >= windowLen - k) {
          return true;
        }

        return (shouldCheckFirst = countList.indexWhere(
              (e) => e >= windowLen - k,
            )) >
            -1;
      }

      while (!isValidWindow()) {
        countList[codeUnits[start_window] - 65]--;
        start_window++;
      }

      longest = max(longest, calWindowLen());
    }

    return longest;
  }
}
