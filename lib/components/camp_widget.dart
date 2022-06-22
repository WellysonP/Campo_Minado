import 'package:flutter/material.dart';

import '../models/camp.dart';

class CampWidget extends StatelessWidget {
  final Camp camp;
  final void Function(Camp) onOpen;
  final void Function(Camp) onChangeMark;

  const CampWidget({
    Key? key,
    required this.camp,
    required this.onOpen,
    required this.onChangeMark,
  }) : super(key: key);

  Widget _getImage() {
    int qtMines = camp.qtMineInNeighbor;

    if (camp.opened && camp.mined && camp.exploded) {
      return Image.asset("assets/images/bomba_0.jpeg");
    } else if (camp.opened && camp.mined) {
      return Image.asset("assets/images/bomba_1.jpeg");
    } else if (camp.opened) {
      return Image.asset("assets/images/aberto_$qtMines.jpeg");
    } else if (camp.marked) {
      return Image.asset("assets/images/bandeira.jpeg");
    } else {
      return Image.asset("assets/images/fechado.jpeg");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(camp),
      onLongPress: () => onChangeMark(camp),
      child: _getImage(),
    );
  }
}
