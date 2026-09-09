// 8
// ms
// Beats
// 100.00%

class Solution {
  List<int> replaceElements(List<int> arr) {
    for (var i = 1; i < arr.length; i++) {
      arr[i - 1] = arr[i];

      for (var j = i - 2; j >= 0; j--) {
        if (arr[i] > arr[j]) {
          arr[j] = arr[i];
        } else if (arr[j] > arr[i]) {
          break;
        }
      }
    }

    arr[arr.length - 1] = -1;

    return arr;
  }
}
