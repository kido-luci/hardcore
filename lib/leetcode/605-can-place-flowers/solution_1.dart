// 1
// ms
// Beats
// 93.75%

class Solution {
  bool canPlaceFlowers(List<int> flowerbed, int n) {
    final len = flowerbed.length;

    if (n == 0) return true;

    if ((len ~/ 2) + 1 < n) return false;

    bool check(int i) {
      if (i < 0 || i == len) return true;
      return flowerbed[i] == 0;
    }

    for (var i = 0; i < len; i++) {
      if (flowerbed[i] == 0) {
        if (check(i - 1) && check(i + 1)) {
          if (--n == 0) return true;
          flowerbed[i++] = 1;
        }
      } else {
        i++;
      }

      if (((len - i) / 2) + 1 < n) return false;
    }

    return false;
  }
}
