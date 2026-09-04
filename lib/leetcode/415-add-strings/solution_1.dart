// 8
// ms
// Beats
// 84.62%

class Solution {
  String addStrings(String num1, String num2) {
    return num1.length > num2.length ? impl(num1, num2) : impl(num2, num1);
  }

  String impl(String l, String s) {
    String result = '';

    int remember = 0;

    for (var i = 0; i < l.length; i++) {
      final l_i = l.length - 1 - i;
      final s_i = s.length - 1 - i;

      final l_d = take_digit(l, l_i);
      final s_d = s_i >= 0 ? take_digit(s, s_i) : 0;

      final sum = l_d + s_d + remember;

      result = String.fromCharCode((sum % 10) + 48) + result;
      remember = sum ~/ 10;
    }

    if (remember > 0) result = String.fromCharCode(remember + 48) + result;

    return result;
  }

  int take_digit(String s, int i) => s.codeUnitAt(i) - 48;
}
