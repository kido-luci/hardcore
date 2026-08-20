// 0
// ms
// Beats
// 100.00%

class Solution {
  List<String> buildArray(List<int> target, int n) {
    final operations = <String>[];
    var j = 0;

    for (var i = 1; i <= n; i++) {
      // print(i);

      operations.add('Push');

      if (i == target[j]) {
        j++;

        if (j == target.length) {
          return operations;
        }
      } else {
        operations.add('Pop');
      }
    }

    return operations;
  }
}
