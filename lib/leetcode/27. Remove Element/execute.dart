import 'solution_1.dart';

void main(List<String> args) {
  //   Example 1:

  // Input: nums = [3,2,2,3], val = 3
  // Output: 2, nums = [2,2,_,_]
  check([3, 2, 2, 3], 3, 2);

  //   Example 2:

  // Input: nums = [0,1,2,2,3,0,4,2], val = 2
  // Output: 5, nums = [0,1,4,0,3,_,_,_]
  check([0, 1, 2, 2, 3, 0, 4, 2], 2, 5);
}

check(List<int> nums, int val, int expect) {
  print('nums $nums');
  print('val $val');
  print('expect $expect');

  print('result ${Solution().removeElement(nums, val)}');
  print('***');
}
