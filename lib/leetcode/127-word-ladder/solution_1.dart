import 'dart:collection';

// 130
// ms
// Beats
// 100.00%

class Solution {
  int ladderLength(String beginWord, String endWord, List<String> wordList) {
    final dictionary = wordList.toSet();

    final queue = ListQueue<(String, int)>(wordList.length);

    final visited = <String>{};

    bool add_2_queue(String word, int moved) {
      if (word == beginWord) return true;
      if (!dictionary.contains(word) || !visited.add(word)) return false;
      queue.add((word, moved));

      return false;
    }

    if (add_2_queue(endWord, 1)) return 1;

    while (queue.isNotEmpty) {
      var (word, moved) = queue.removeFirst();
      moved++;

      final chils = connect(word);

      for (final e in chils) {
        if (add_2_queue(e, moved)) return moved;
      }
    }

    return 0;
  }

  List<String> connect(String word) {
    final childs = <String>[];

    final codes = word.codeUnits.toList(growable: false);

    for (var i = 0; i < codes.length; i++) {
      final tmp = codes[i];

      for (var j = 97; j < 123; j++) {
        codes[i] = j;
        childs.add(String.fromCharCodes(codes));
      }

      codes[i] = tmp;
    }

    return childs;
  }
}
