import 'package:campo_minado/models/explod_exception.dart';

class Camp {
  final int row;
  final column;
  final List<Camp> neighbors = [];

  bool _opened = false;
  bool _marked = false;
  bool _mined = false;
  bool _exploded = false;

  Camp({
    required this.row,
    required this.column,
  });

  void addNeighbor(Camp neighbor) {
    final deltaRow = (row - neighbor.row).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if (deltaRow == 0 && deltaColumn == 0) {
      return;
    }
    if (deltaRow <= 1 && deltaColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  void open() {
    if (_opened) {
      return;
    }
    _opened = true;

    if (_mined) {
      _exploded = true;
      throw ExplodException();
    }

    if (securityNeighbor) {
      neighbors.forEach((neighbor) => neighbor.open());
    }
  }

  void showBomb() {
    if (_mined) {
      _opened = true;
    }
  }

  void undermine() {
    _mined = true;
  }

  void changeMark() {
    _marked = !_marked;
  }

  void reboot() {
    _opened = false;
    _marked = false;
    _mined = false;
    _exploded = false;
  }

  bool get mined {
    return _mined;
  }

  bool get exploded {
    return _exploded;
  }

  bool get opened {
    return _opened;
  }

  bool get marked {
    return _marked;
  }

  bool get solved {
    bool minedAndMarked = mined && marked;
    bool securityAndOpened = !mined && opened;
    return minedAndMarked || securityAndOpened;
  }

  bool get securityNeighbor {
    return neighbors.every((neighbor) => !neighbor.mined);
  }

  int get qtMineInNeighbor {
    return neighbors.where((neighbor) => neighbor.mined).length;
  }
}
