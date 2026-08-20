// 7
// ms
// Beats
// 100.00%

class Solution {
  String oddString(List<String> words) {
    final counter = <String, (String, int)>{};

    for (final word in words) {
      final diff = StringBuffer();

      for (var i = 0; i < word.length - 1; i++) {
        diff.write('${word.codeUnitAt(i + 1) - word.codeUnitAt(i)},');
      }

      // print(diff);

      counter.update(
        diff.toString(),
        (e) => (e.$1, 2),
        ifAbsent: () => (word, 1),
      );

      if (counter.length == 2) {
        if (counter.values.elementAt(0).$2 == 2) {
          return counter.values.elementAt(1).$1;
        } else if (counter.values.elementAt(1).$2 == 2) {
          return counter.values.elementAt(0).$1;
        }
      }
    }

    return '';
  }
}
