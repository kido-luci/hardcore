// leet code codeunit
// A -> Z = 65 -> 90
// a -> z = 97 -> 122
// first merge it in two one list contains 26 x 2 letters
// - to counter the letter appear times in the hashmap
//
// the question is that is the current window valid
// i will create the match counter, when the match equal the t length
// it mean the current window is valid
//
// ~5ms
class Solution {
  String minWindow(String s, String t) {
    // because the problem is find the sub string that
    // contain every char in t, so we create the hashmap counter for t
    final t_counters = List.filled(52, 0);

    for (final e in t.codeUnits) {
      t_counters[counterIndex(e)]++;
    }

    // we only take the value appear on the t
    final s_take = List.filled(52, 0);

    var match = 0; // count the matched char with t
    var start = 0; // start index of the window

    (int start, int end)? minWindow;

    final s_codeUnits = s.codeUnits;
    for (var i = 0; i < s_codeUnits.length; i++) {
      final current_index = counterIndex(s_codeUnits[i]);
      if (t_counters[current_index] > 0) {
        if (t_counters[current_index] > s_take[current_index]) {
          // when the t_counters have remain unit to take, increase the match count
          match++;
        }

        s_take[current_index]++;
      }

      if (match == 0) {
        // when the the current window is not match any letter with t
        // set start = i
        start == i;
        continue;
      }

      if (match == t.length) {
        while (start < i) {
          final startCounterIndex = counterIndex(s_codeUnits[start]);

          if (t_counters[startCounterIndex] == 0) {
            // when the t not contains the start letter, move start by one
            start++;
            continue;
          }

          // when the current window matched all with t
          // we can try to move the start to decrease the size of the window

          if (s_take[startCounterIndex] > t_counters[startCounterIndex]) {
            // when the t contains the start letter
            // and the taked counter is lager than the t counter
            // it mean we can remove the current letter without decrease the match
            s_take[startCounterIndex]--;
            start++;
            continue;
          }

          //otherwise when the s_take[startCounterIndex] equal with the t_counters[startCounterIndex]
          // we can break the reduce window size loop, because no more way to optimize the window
          break;
        }

        // print((s.substring(start, i + 1), match));

        final currentWindowLen = i - start + 1;
        if (minWindow == null ||
            minWindow.$2 - minWindow.$1 + 1 > currentWindowLen) {
          minWindow = (start, i);
        }
      }
    }

    return minWindow != null ? s.substring(minWindow.$1, minWindow.$2 + 1) : "";
  }

  int counterIndex(int codeUnit) {
    final index =
        codeUnit -
        65 // A
        -
        (codeUnit < 97
            ? 0 // [A-Z]
            : 6 // [a-z] => a -> Z = 97 -> 90
              );

    // print((String.fromCharCode(codeUnit), index));

    return index;
  }
}
