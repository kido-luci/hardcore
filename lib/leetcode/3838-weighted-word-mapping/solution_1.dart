// 10
// ms
// Beats
// 50.00%
// class Solution {
//   String mapWordWeights(List<String> words, List<int> weights) {
//     final buffer = StringBuffer();

//     for (final word in words) {
//       final weight = word.codeUnits.fold(0, (sum, e) => sum + weights[e - 97]);

//       buffer.writeCharCode(25 - (weight % 26) + 97);
//     }

//     return buffer.toString();
//   }
// }

// 6
// ms
// Beats
// 75.00%

class Solution {
  String mapWordWeights(List<String> words, List<int> weights) {
    final buffer = StringBuffer();

    for (final word in words) {
      buffer.writeCharCode(
        122 - (word.codeUnits.fold(0, (sum, e) => sum + weights[e - 97]) % 26),
      );
    }

    return buffer.toString();
  }
}
