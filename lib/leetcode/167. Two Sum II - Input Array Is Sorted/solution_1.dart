// 1~2ms
class Solution {
  List<int> twoSum(List<int> numbers, int target) {
    var left = 0, right = numbers.length - 1;

    // loop until two edge is same index or out of range
    while (right > left) {
      final sum = numbers[left] + numbers[right];

      if (sum == target) {
        // output: two numbers index1 and index2, each incremented by one
        return [left + 1, right + 1];
      }

      // how to cutoff the list, cut on left or right?
      // cuz the list is sorted on [non decs order]
      // if the sum > target => we have to decrease the sum
      //     => move right index
      // otherwise => move left index

      // [2,7,11,15] target = 9
      // [2,7,11] (move right--)
      // [2,7] => result

      // [2,(3),4], target = 6 => return immediately

      // [2,3,4], target = 7
      // [3,4] => result (move left++)

      if (sum > target) {
        right--;
      } else {
        left++;
      }
    }

    //no result return empty list
    return [];
  }
}
