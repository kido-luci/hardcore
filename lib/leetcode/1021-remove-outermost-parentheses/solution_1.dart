// 14
// ms
// Beats
// -%
// class Solution {
//   String removeOuterParentheses(String s) {
//     var result = '';

//     final stacks = <int>[];
//     int open = 0;

//     for (var i = 0; i < s.length; i++) {
//       stacks.add(s.codeUnitAt(i));

//       if (s[i] == '(') {
//         open++;
//       } else {
//         open--;
//       }

//       if (open == 0) {
//         result += String.fromCharCodes(stacks.sublist(1, stacks.length - 1));
//         stacks.clear();
//       }
//     }

//     return result;
//   }
// }

// 14
// ms
// Beats
// -%
// class Solution {
//   String removeOuterParentheses(String s) {
//     var result = '';

//     final stacks = <int>[];
//     int open = 0;

//     for (var i = 0; i < s.length; i++) {
//       if (s.codeUnitAt(i) == 40) {
//         stacks.add(40);
//         open++;
//       } else {
//         stacks.add(41);
//         open--;
//       }

//       if (open == 0) {
//         result += String.fromCharCodes(stacks.sublist(1, stacks.length - 1));
//         stacks.clear();
//       }
//     }

//     return result;
//   }
// }

// 8
// ms
// Beats
// -%
// class Solution {
//   String removeOuterParentheses(String s) {
//     var result = '';

//     int open = 0;

//     for (final e in s.codeUnits) {
//       if (e == 40) {
//         if (open != 0) {
//           result += '(';
//         }

//         open++;
//       } else {
//         open--;

//         if (open != 0) {
//           result += ')';
//         }
//       }
//     }

//     return result;
//   }
// }

// 7
// ms
// Beats
// 66.67%

class Solution {
  String removeOuterParentheses(String s) {
    final buffer = StringBuffer();

    int open = 0;

    for (final e in s.codeUnits) {
      if (e == 40) {
        if (open != 0) {
          buffer.write('(');
        }

        open++;
      } else {
        open--;

        if (open != 0) {
          buffer.write(')');
        }
      }
    }

    return buffer.toString();
  }
}
