// 103
// ms
// Beats
// -%

class Solution {
  bool asteroidsDestroyed(int mass, List<int> asteroids) {
    asteroids.sort();

    if (mass >= asteroids.last) return true;

    for (final e in asteroids) {
      if (mass < e) return false;
      // if (mass == e) return i == asteroids.length - 1;

      mass += e;
    }

    return true;
  }
}
