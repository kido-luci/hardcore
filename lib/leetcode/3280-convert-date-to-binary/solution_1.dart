// 3
// ms
// Beats
// 100.00%

class Solution {
  String convertDateToBinary(String date) {
    return decToBi(int.parse(date.substring(0, 4))) +
        '-' +
        decToBi(int.parse(date.substring(5, 7))) +
        '-' +
        decToBi(int.parse(date.substring(8, 10)));
  }

  String decToBi(int dec) {
    String result = '';

    do {
      result = (dec % 2).toString() + result;
      dec ~/= 2;
    } while (dec > 0);

    return result;
  }
}
