// 16
// ms
// Beats
// 77.12%

class Solution {
  bool validMountainArray(List<int> arr) {
    if (arr.length < 3) return false;
    if (arr[0] > arr[1] || arr[arr.length - 1] > arr[arr.length - 2]) return false;
    bool f = true;

    for (var i = 1; i < arr.length; i++) {
      if (arr[i] == arr[i - 1]) return false;

      if (f) {
        if (arr[i] < arr[i - 1]) f = false;
      } else {
        if (arr[i] > arr[i - 1]) return false;
      }
    }

    return true;
  }
}
