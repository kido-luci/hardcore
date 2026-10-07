// 2
// ms
// Beats
// 66.67%

class Solution {
  int countStudents(List<int> students, List<int> sandwiches) {
    int dislike = 0;
    int s_i = 0;

    while (students.isNotEmpty && dislike < students.length) {
      final v = students.removeAt(0);
      if (v == sandwiches[s_i]) {
        s_i++;
        dislike = 0;
      } else {
        dislike++;
        students.add(v);
      }
    }

    return students.length;
  }
}
