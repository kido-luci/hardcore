import 'dart:typed_data';

// 3
// ms
// Beats
// 100.00%

class Solution {
  List<int> sortEvenOdd(List<int> nums) {
    final odd = <int>[];
    final even = <int>[];

    for (var i = 0; i < nums.length; i++) (i.isEven ? even : odd).add(i);

    final new_odd = List<int>.from(odd)..sort((a, b) => nums[b].compareTo(nums[a]));
    final new_even = List<int>.from(even)..sort((a, b) => nums[a].compareTo(nums[b]));

    final result = Uint8List(nums.length);

    for (var i = 0; i < odd.length; i++) result[odd[i]] = nums[new_odd[i]];
    for (var i = 0; i < even.length; i++) result[even[i]] = nums[new_even[i]];

    return result;
  }
}
