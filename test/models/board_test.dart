import 'package:campo_minado/models/board.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test("Win game", () {
    Board board = Board(rows: 2, columns: 2, qtBombs: 0);
    board.camps[0].undermine();
    board.camps[3].undermine();

    board.camps[0].changeMark();
    board.camps[1].open();
    board.camps[2].open();
    board.camps[3].changeMark();

    expect(board.solved, isTrue);
  });
}
