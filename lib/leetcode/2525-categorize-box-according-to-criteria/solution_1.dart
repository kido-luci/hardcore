// 0
// ms
// Beats
// 100.00%

class Solution {
  String categorizeBox(int length, int width, int height, int mass) {
    const p4 = 10000;
    const p9 = 1000000000;

    bool is_bulky =
        length >= p4 ||
        width >= p4 ||
        height >= p4 ||
        length * height * width >= p9;
    bool is_heavy = mass >= 100;

    if (is_heavy && is_bulky) return 'Both';
    if (is_heavy) return 'Heavy';
    if (is_bulky) return 'Bulky';

    return 'Neither';
  }
}
