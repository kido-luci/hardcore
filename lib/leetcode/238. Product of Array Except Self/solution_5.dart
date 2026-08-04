//3~10ms
// how about two loop on one list?

// pro[i] = [0… i - 1] * [ i +1…n-1]
//               left i -1   *.  right (n - 1) - i - 1

// input [1,2,3,4]
// left [1, 2_, 6_, 24]
// right [4_, 12, 24, 24]
// ——
// result [24,12,8,6]
// [24, left _ * right 24
// 12, left 1 * right _ 12
// 8, = left 2 * right 4
// 6 = i0*…i[n-1 - 1] = left 6 * right _
// ]
// —
// input [1,2,3,4]
// first fill should be [_,1,2,6]
// on next loop:
// [ 24 =  _ 4 * 3 * 2,
//   12 = 1 * 4 *3 ,
//    8 = 2 * 4,
//    6 = 6 * _
// ]
class Solution {
  List<int> productExceptSelf(List<int> nums) {
    final lefts = List.filled(nums.length, 1);
    // final rights = List.filled(nums.length, 1);

    final length = nums.length;

    var left = 1;
    // var right = 1;

    for (var j = 0; j < length; j++) {
      lefts[j] = left;
      left *= nums[j];
      // rights[j] = right *= nums[length - j - 1];
    }

    var right = 1;
    for (var j = length - 1; j >= 0; j--) {
      lefts[j] *= right;
      right *= nums[j];
    }

    // print(lefts);
    // print(rights);

    // final result = <int>[];

    // for (var i = 0; i < length; i++) {
    //   final left = i <= 0 ? 1 : lefts[i - 1];
    //   final right = i >= length - 1 ? 1 : rights[(length - 1) - i - 1];

    //   // print(left);
    //   // print(right);
    //   // print('---');

    //   result.add(left * right);
    // }

    return lefts;
  }
}
