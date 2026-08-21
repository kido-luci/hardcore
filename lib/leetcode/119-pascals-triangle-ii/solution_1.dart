// 3
// ms
// Beats
// 16.67%
//
//
// class Solution {
//   List<int> getRow(int rowIndex) {
//     var result = <int>[1];

//     for (var i = 1; i <= rowIndex; i++) {
//       final newRow = <int>[1];

//       for (var j = 1; j <= i - 1; j++) {
//         newRow.add(result[j - 1] + result[j]);
//       }

//       newRow.add(1);

//       // print(newRow);

//       result = newRow;
//     }

//     return result;
//   }
// }

// 0
// ms
// Beats
// 100.00%

class Solution {
  List<int> getRow(int rowIndex) {
    var result = <int>[1];

    for (var i = 1; i <= rowIndex; i++) {
      int cache = 1;

      for (var j = 1; j <= i - 1; j++) {
        // print(cache);
        // print(result);

        final newVal = cache + result[j];
        cache = result[j];
        result[j] = newVal;
      }

      result.add(1);

      // print(result);
    }

    return result;
  }
}
