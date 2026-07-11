// import 'solution_1.dart';
// import 'solution_2.dart';
import 'solution_3.dart';

void main(List<String> args) {
  //   Example 1:

  // Input: nums = [1,3,5,6], target = 5
  // Output: 2
  check([1, 3, 5, 6], 5, 2);

  //   Example 2:

  // Input: nums = [1,3,5,6], target = 2
  // Output: 1
  check([1, 3, 5, 6], 2, 1);

  //   Example 3:

  // Input: nums = [1,3,5,6], target = 7
  // Output: 4
  check([1, 3, 5, 6], 7, 4);

  check([1], 1, 0);

  check([1, 3], 3, 1);
}

check(List<int> nums, int target, int expect) {
  print('nums $nums');
  print('target $target');
  print('expect $expect');

  print('result ${Solution().searchInsert(nums, target)}');
  print('***');
}
