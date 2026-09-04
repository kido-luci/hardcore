// 2
// ms
// Beats
// 100.00%

class Solution {
  List<String> fizzBuzz(int n) {
    final r = <String>[];

    for (var i = 1; i <= n; i++) {
      if (i % 15 == 0) {
        r.add('FizzBuzz');
        continue;
      }

      if (i % 5 == 0) {
        r.add('Buzz');
        continue;
      }

      if (i % 3 == 0) {
        r.add('Fizz');
        continue;
      }

      r.add(i.toString());
    }

    return r;
  }
}
