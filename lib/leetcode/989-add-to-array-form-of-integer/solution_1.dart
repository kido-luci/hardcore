// 8
// ms
// Beats
// 80.00%

class Solution {
  List<int> addToArrayForm(List<int> num, int k) {
    final k_l = k.toString().codeUnits.map((e) => e - 48).toList();

    return num.length > k_l.length ? impl(num, k_l) : impl(k_l, num);
  }

  List<int> impl(List<int> l, List<int> s) {
    final result = <int>[];

    int remember = 0;

    for (var i = 0; i < l.length; i++) {
      final l_i = l.length - 1 - i;
      final s_i = s.length - 1 - i;

      final l_d = l[l_i];
      final s_d = s_i >= 0 ? s[s_i] : 0;

      final sum = l_d + s_d + remember;

      result.add(sum % 10);
      remember = sum ~/ 10;
    }

    if (remember > 0) result.add(remember);

    return result.reversed.toList();
  }
}
