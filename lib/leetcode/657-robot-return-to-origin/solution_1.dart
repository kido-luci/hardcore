// 2
// ms
// Beats
// 100.00%

class Solution {
  bool judgeCircle(String moves) {
    var r = 0, c = 0;

    for (var i = 0; i < moves.length; i++) {
      switch (moves[i]) {
        case 'L':
          r -= 1;
          break;
        case 'R':
          r += 1;
          break;
        case 'U':
          c -= 1;
          break;
        default:
          c += 1;
      }
    }

    return r == 0 && c == 0;
  }
}
