import 'package:campo_minado/models/camp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Camp", () {
    test("Open camp WITH explosion", () {
      Camp c = Camp(row: 0, column: 0);
      c.undermine();

      expect(c.open, throwsException);
    });

    test("Open camp WITHOUT explosion", () {
      Camp c = Camp(row: 0, column: 0);
      c.open();

      expect(c.opened, isTrue);
    });

    test("Add NO neighbor", () {
      Camp c1 = Camp(row: 0, column: 0);
      Camp c2 = Camp(row: 1, column: 3);

      c1.addNeighbor(c2);
      expect(c1.neighbors.isEmpty, isTrue);
    });

    test("Add neighbor", () {
      Camp c1 = Camp(row: 3, column: 3);
      Camp c2 = Camp(row: 3, column: 4);
      Camp c3 = Camp(row: 2, column: 2);
      Camp c4 = Camp(row: 4, column: 4);

      c1.addNeighbor(c2);
      c1.addNeighbor(c3);
      c1.addNeighbor(c4);
      expect(c1.neighbors.length, 3);
    });
    test("Mines in neighbor", () {
      Camp c1 = Camp(row: 3, column: 3);
      Camp c2 = Camp(row: 3, column: 4);
      c2.undermine();
      Camp c3 = Camp(row: 2, column: 2);
      Camp c4 = Camp(row: 4, column: 4);
      c4.undermine();

      c1.addNeighbor(c2);
      c1.addNeighbor(c3);
      c1.addNeighbor(c4);
      expect(c1.qtMineInNeighbor, 2);
    });
  });
}
