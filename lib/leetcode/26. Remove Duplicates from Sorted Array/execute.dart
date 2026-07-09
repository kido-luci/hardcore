import 'solution_1.dart';

void main(List<String> args) {
  //   Example 1:

  // Input: ${Solution().removeDuplicates(nums)} = [1,1,2]
  // Output: 2, nums = [1,2,_]
  check([1, 1, 2], 2);

  //   Example 2:

  // Input: nums = [0,0,1,1,1,2,2,3,3,4]
  // Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]

  // check([0, 0, 1, 1, 1, 2, 2, 3, 3, 4], 5);
}

check(List<int> nums, int expect) {
  print('nums $nums');
  print('expect $expect');

  List<int> expectedNums = [1, 2];

  int k = Solution().removeDuplicates(nums);

  print(k);
  print(nums);
  print(expectedNums);

  for (int i = 0; i < k; i++) {
    print(k);
    print(nums);
    print(expectedNums);
    print('$i ${nums[i]} == ${expectedNums[i]}');
  }

  // print('result ${Solution().removeDuplicates(nums)}');
  print('***');
}

// nums [1, 1, 2]
// expect 2
// 2
// [1, 2, 2]
// [1, 2]
// 2
// [1, 2, 2]
// [1, 2]
// 0 1 == 1
// 2
// [1, 2, 2]
// [1, 2]
// 1 2 == 2
// ***

// nums [1, 1, 2]
// expect 2
// 2
// [1, 1, 2]
// [1, 2]
// 2
// [1, 1, 2]
// [1, 2]
// 0 1 == 1
// 2
// [1, 1, 2]
// [1, 2]
// 1 1 == 2
// ***
