import 'dart:typed_data';

// 9
// ms
// Beats
// 100.00%
//
class Solution {
  int largestInteger(int num) {
    final digits = <int>[];
    final odd = <int>[];
    final even = <int>[];

    int i = 0;

    while (num > 0) {
      final v = num % 10;
      digits.add(v);
      (v.isEven ? even : odd).add(i++);
      num ~/= 10;
    }

    final new_odd = List<int>.from(odd)..sort((a, b) => digits[a].compareTo(digits[b]));
    final new_even = List<int>.from(even)..sort((a, b) => digits[a].compareTo(digits[b]));

    final result = Uint8List(digits.length);

    for (var i = 0; i < odd.length; i++) result[odd[i]] = digits[new_odd[i]];
    for (var i = 0; i < even.length; i++) result[even[i]] = digits[new_even[i]];

    for (var j = digits.length - 1; j >= 0; j--) num = (num * 10) + result[j];

    return num;
  }
}
