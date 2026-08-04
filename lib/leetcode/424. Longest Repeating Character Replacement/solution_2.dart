// import 'dart:math';

// // no need to reorder the to find max on map have only 26 element
// // for each is better
// //~22ms On_+<=26
// class Solution {
//   int characterReplacement(String s, int k) {
//     var start_window = 0, longest = 0;

//     var codeUnits = s.codeUnits;

//     // alphabet A->Z = 26chars
//     // A = 65 in codeUnit dec -> insert e to list have to minus by 65
//     final countList = List.filled(26, 0);

//     for (var i = 0; i < codeUnits.length; i++) {
//       countList[codeUnits[i] - 65]++;

//       int calWindowLen() => i - start_window + 1;

//       bool isValidWindow() {
//         final windowLen = calWindowLen();

//         for (final e in countList) {
//           if (e >= windowLen - k) {
//             return true;
//           }
//         }

//         return false;
//       }

//       while (!isValidWindow()) {
//         countList[codeUnits[start_window] - 65]--;
//         start_window++;
//       }

//       longest = max(longest, calWindowLen());
//     }

//     return longest;
//   }
// }

import 'dart:math';

// no need to reorder the to find max on map have only 26 element
// for each is better
//~22ms On_+<=26
class Solution {
  int characterReplacement(String s, int k) {
    var start_window = 0, longest = 0;

    var codeUnits = s.codeUnits;

    // alphabet A->Z = 26chars
    // A = 65 in codeUnit dec -> insert e to list have to minus by 65
    final countList = List.filled(26, 0);

    for (var i = 0; i < codeUnits.length; i++) {
      countList[codeUnits[i] - 65]++;

      bool isValidWindow() {
        final windowLen = i - start_window + 1;

        for (final e in countList) {
          if (e >= windowLen - k) {
            return true;
          }
        }

        return false;
      }

      while (!isValidWindow()) {
        countList[codeUnits[start_window] - 65]--;
        start_window++;
      }

      longest = max(longest, i - start_window + 1);
    }

    return longest;
  }
}
