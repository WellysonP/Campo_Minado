import 'dart:math';

import 'package:campo_minado/models/camp.dart';
import 'package:flutter/cupertino.dart';

class Board {
  final int rows;
  final columns;
  final int qtBombs;
  final List<Camp> _camps = [];

  Board({
    required this.rows,
    required this.columns,
    required this.qtBombs,
  }) {
    _makeCamps();
    _listNeighbors();
    _randomMines();
  }

  void showBombs() {
    _camps.forEach((camp) => camp.showBomb());
  }

  void reboot() {
    _camps.forEach((camp) => camp.reboot());
    _randomMines();
  }

  void _makeCamps() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < columns; c++) {
        _camps.add(Camp(row: r, column: c));
      }
    }
  }

  void _listNeighbors() {
    for (var camp in _camps) {
      for (var neighbor in _camps) {
        camp.addNeighbor(neighbor);
      }
    }
  }

  void _randomMines() {
    int qtRandom = 0;

    if (qtBombs > rows * columns) {
      return;
    }

    while (qtRandom < qtBombs) {
      int i = Random().nextInt(_camps.length);

      if (!_camps[i].mined) {
        qtRandom++;
        _camps[i].undermine();
      }
    }
  }

  List<Camp> get camps {
    return _camps;
  }

  bool get solved {
    return _camps.every((camp) => camp.solved);
  }
}
