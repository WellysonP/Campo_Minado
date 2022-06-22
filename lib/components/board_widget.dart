import 'package:campo_minado/components/camp_widget.dart';
import 'package:campo_minado/models/board.dart';
import 'package:campo_minado/models/camp.dart';
import 'package:flutter/cupertino.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final void Function(Camp) onOpen;
  final void Function(Camp) onChangeMark;

  const BoardWidget({
    Key? key,
    required this.board,
    required this.onOpen,
    required this.onChangeMark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: board.columns,
        children: board.camps.map((camp) {
          return CampWidget(
            camp: camp,
            onOpen: onOpen,
            onChangeMark: onChangeMark,
          );
        }).toList(),
      ),
    );
  }
}
