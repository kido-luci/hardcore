// 2-3ms
class Solution {
  bool isPalindrome(String s) {
    final codeUnits = s.codeUnits;
    var i = 0, j = codeUnits.length - 1;

    int? left;

    while (j > i) {
      if (left == null) {
        // if previous left is null, check current left
        left = checkCode(codeUnits[i]);

        if (left == null) {
          // increase the i then continue the loop until left is valid
          i++;
          continue;
        }
      }

      final right = checkCode(codeUnits[j]);
      if (right == null) {
        // decrease the j then continue the loop until right is valid
        j--;
        continue;
      }

      // print('$left-$right');

      // when left and right is valid, compare them
      if (left != right) {
        return false;
      }

      // if left equal right, update the pointer the continue the loop
      // until we scan all
      i++;
      j--;

      // don't forgot reset the left value
      left = null;
    }

    return true;
  }

  int? checkCode(int code) {
    if (
    // if char is number return original
    code >= 48 && code <= 57 ||
        // if char is lowercase return original
        code >= 97 && code <= 122) {
      return code;
    }

    // if char is upper case => convert to lowercase
    if ((code >= 65 && code <= 90)) {
      // 97 - 65 = 32
      return code + 32;
    }

    // return null on invalid
    return null;
  }
}
