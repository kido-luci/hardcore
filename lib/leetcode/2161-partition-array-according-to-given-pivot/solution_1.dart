// 22
// ms
// Beats
// 50.00%
// class Solution {
//   List<int> pivotArray(List<int> nums, int pivot) {
//     final smaller = <int>[];
//     final equal = <int>[];
//     final larger = <int>[];

//     for (final e in nums) {
//       if (e < pivot) {
//         smaller.add(e);
//       } else if (e > pivot) {
//         larger.add(e);
//       } else {
//         equal.add(e);
//       }
//     }

//     return [...smaller, ...equal, ...larger];
//   }
// }

// 9
// ms
// Beats
// 100.00%
class Solution {
  List<int> pivotArray(List<int> nums, int pivot) {
    var smaller = 0;
    var equal = 0;

    for (final e in nums) {
      if (e < pivot) {
        smaller++;
      } else if (e == pivot) {
        equal++;
      }
    }

    // print((smaller, equal));

    var larger = smaller + equal;
    smaller = 0;

    final result = List.filled(nums.length, pivot);

    for (final e in nums) {
      if (e < pivot) {
        result[smaller] = e;
        smaller++;
      } else if (e > pivot) {
        result[larger] = e;
        larger++;
      }
    }

    return result;
  }
}
