// 19
// ms
// Beats
// 100.00%

class Solution {
  int minMovesToSeat(List<int> seats, List<int> students) {
    seats.sort();
    students.sort();

    int move = 0;

    for (var i = 0; i < students.length; i++) {
      move += (seats[i] - students[i]).abs();
    }

    return move;
  }
}
