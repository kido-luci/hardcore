import 'dart:math';

// 25
// ms
// Beats
// 100.00%

class Solution {
  late final int r, c, area;
  late final List<List<int>> isInfected;
  late final RingQueue<(int, int)> queue;
  late final RingQueue<(int, int)> rever_queue;
  late final RingQueue<(int, int, int)> simulation_count;
  int day = 1;
  var most = 0;
  var current_infected = 0;
  var walls = 0;

  void init(List<List<int>> isInfected) {
    // for (final e in isInfected) {
    //   print(e);
    // }

    r = isInfected.length;
    c = isInfected.first.length;
    area = r * c;
    this.isInfected = isInfected;
    queue = RingQueue<(int, int)>(area);
    rever_queue = RingQueue<(int, int)>(area);
    simulation_count = RingQueue<(int, int, int)>(area);
  }

  int try_infect(int i, int j) {
    if (i < 0 || i == r || j < 0 || j == c) return 0;
    if (isInfected[i][j] != 0) return 0;

    isInfected[i][j] = area + 1;
    rever_queue.add((i, j));

    return 1;
  }

  void add_2_simulation(int i, int j) {
    if (i < 0 || i == r || j < 0 || j == c) return;
    if (isInfected[i][j] != day) return;

    isInfected[i][j] = -(day + 1);

    queue.add((i, j));

    current_infected +=
        try_infect(i, j - 1) +
        try_infect(i - 1, j) +
        try_infect(i, j + 1) +
        try_infect(i + 1, j);
  }

  void start_simulation(int i, int j) {
    current_infected = 0;

    add_2_simulation(i, j);

    while (queue.isNotEmpty) {
      final (i_1, j_1) = queue.removeFirst();

      add_2_simulation(i_1, j_1 - 1);
      add_2_simulation(i_1 - 1, j_1);
      add_2_simulation(i_1, j_1 + 1);
      add_2_simulation(i_1 + 1, j_1);
    }

    simulation_count.add((i, j, current_infected));
    most = max(most, current_infected);

    while (rever_queue.isNotEmpty) {
      final (i, j) = rever_queue.removeFirst();
      isInfected[i][j] = 0;
    }
  }

  void build_wall(int i, int j) {
    if (i < 0 || i == r || j < 0 || j == c) return;
    final val = isInfected[i][j];

    if (val == -day || val == -1) return;

    walls++;
  }

  void add_2_block(int i, int j) {
    if (i < 0 || i == r || j < 0 || j == c) return;
    if (isInfected[i][j] != -day) return;

    isInfected[i][j] = -1;

    build_wall(i, j - 1);
    build_wall(i - 1, j);
    build_wall(i, j + 1);
    build_wall(i + 1, j);

    queue.add((i, j));
  }

  void apply_infect(int i, int j) {
    if (i < 0 || i == r || j < 0 || j == c) return;
    if (isInfected[i][j] != 0) return;

    isInfected[i][j] = day;
  }

  void add_2_infect(int i, int j) {
    if (i < 0 || i == r || j < 0 || j == c) return;
    if (isInfected[i][j] != -day) return;

    isInfected[i][j] = day;

    apply_infect(i, j - 1);
    apply_infect(i - 1, j);
    apply_infect(i, j + 1);
    apply_infect(i + 1, j);

    queue.add((i, j));
  }

  void end_day_handler() {
    while (simulation_count.isNotEmpty) {
      final (i, j, infected) = simulation_count.removeFirst();

      if (infected == most) {
        add_2_block(i, j);

        while (queue.isNotEmpty) {
          final (i_1, j_1) = queue.removeFirst();

          add_2_block(i_1, j_1 - 1);
          add_2_block(i_1 - 1, j_1);
          add_2_block(i_1, j_1 + 1);
          add_2_block(i_1 + 1, j_1);
        }
      } else {
        add_2_infect(i, j);

        while (queue.isNotEmpty) {
          final (i_1, j_1) = queue.removeFirst();

          add_2_infect(i_1, j_1 - 1);
          add_2_infect(i_1 - 1, j_1);
          add_2_infect(i_1, j_1 + 1);
          add_2_infect(i_1 + 1, j_1);
        }
      }
    }
  }

  int containVirus(List<List<int>> isInfected) {
    init(isInfected);

    bool is_last_day = false;

    while (!is_last_day) {
      // print('#*#*#*#*#*');

      most = 0;

      for (var i = 0; i < r; i++)
        for (var j = 0; j < c; j++)
          if (isInfected[i][j] == day) start_simulation(i, j);

      // print('day: $day, most: $most');
      // for (final e in isInfected) {
      //   print(e);
      // }

      // print('-------');

      is_last_day = simulation_count.length < 2;

      day++;

      end_day_handler();

      // for (final e in isInfected) {
      //   print(e);
      // }
    }

    return walls;
  }
}

class RingQueue<T> {
  final List<T?> _buf;
  final int _capacity;
  int _head = 0;
  int _length = 0;

  RingQueue(int capacity)
    : _capacity = capacity,
      _buf = List<T?>.filled(capacity, null);

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  /// The front of the queue, without removing it.
  T get first => _buf[_head] as T;

  void add(T value) {
    var tail = _head + _length;
    if (tail >= _capacity) tail -= _capacity;

    _buf[tail] = value;
    _length++;
  }

  T removeFirst() {
    final value = _buf[_head] as T;

    _head++;
    if (_head == _capacity) _head = 0;

    _length--;

    return value;
  }

  void clear() {
    _head = 0;
    _length = 0;
  }

  /// Front to back, in the same `{a, b, c}` format as `dart:collection`'s
  /// `Queue`, so the two print identically when you swap one for the other.
  @override
  String toString() {
    final sb = StringBuffer('{');

    for (var n = 0; n < _length; n++) {
      var index = _head + n;
      if (index >= _capacity) index -= _capacity;

      if (n > 0) sb.write(', ');
      sb.write(_buf[index]);
    }

    sb.write('}');

    return sb.toString();
  }
}

void main() {
  // print(
  //   Solution().containVirus([
  //     [0, 1, 0, 0, 0, 0, 0, 1],
  //     [0, 1, 0, 0, 0, 0, 0, 1],
  //     [0, 0, 0, 0, 0, 0, 0, 1],
  //     [0, 0, 0, 0, 0, 0, 0, 0],
  //   ]),
  // );

  print(
    Solution().containVirus([
      [0, 1, 0, 1, 1, 1, 1, 1, 1, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
      [0, 0, 1, 1, 1, 0, 0, 0, 1, 0],
      [0, 0, 0, 1, 1, 0, 0, 1, 1, 0],
      [0, 1, 0, 0, 1, 0, 1, 1, 0, 1],
      [0, 0, 0, 1, 0, 1, 0, 1, 1, 1],
      [0, 1, 0, 0, 1, 0, 0, 1, 1, 0],
      [0, 1, 0, 1, 0, 0, 0, 1, 1, 0],
      [0, 1, 1, 0, 0, 1, 1, 0, 0, 1],
      [1, 0, 1, 1, 0, 1, 0, 1, 0, 1],
    ]),
  );
}
