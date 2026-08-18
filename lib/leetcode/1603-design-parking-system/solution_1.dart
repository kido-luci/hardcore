// 3
// ms
// Beats
// 100.00%

// class ParkingSystem {
//   late int _remain_big, _remain_medium, _remain_small;

//   ParkingSystem(int big, int medium, int small) {
//     _remain_big = big;
//     _remain_medium = medium;
//     _remain_small = small;
//   }

//   bool addCar(int carType) {
//     switch (carType) {
//       case 1:
//         if (_remain_big > 0) {
//           _remain_big--;
//           return true;
//         }
//         return false;
//       case 2:
//         if (_remain_medium > 0) {
//           _remain_medium--;
//           return true;
//         }
//         return false;
//       default:
//         if (_remain_small > 0) {
//           _remain_small--;
//           return true;
//         }
//         return false;
//     }
//   }
// }

// 3
// ms
// Beats
// 100.00%

class ParkingSystem {
  final remains = List.filled(3, 0);

  ParkingSystem(int big, int medium, int small) {
    remains[0] = big;
    remains[1] = medium;
    remains[2] = small;
  }

  bool addCar(int carType) {
    if (remains[carType - 1] > 0) {
      remains[carType - 1]--;
      return true;
    }

    return false;
  }
}
