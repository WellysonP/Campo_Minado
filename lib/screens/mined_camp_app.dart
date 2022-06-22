import 'package:campo_minado/components/board_widget.dart';
import 'package:campo_minado/components/camp_widget.dart';
import 'package:campo_minado/components/result_widget.dart';
import 'package:campo_minado/models/board.dart';
import 'package:campo_minado/models/explod_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/camp.dart';

class MinedCampApp extends StatefulWidget {
  const MinedCampApp({Key? key}) : super(key: key);

  @override
  State<MinedCampApp> createState() => _MinedCampAppState();
}

class _MinedCampAppState extends State<MinedCampApp> {
  bool? _win;
  Board? _board;

  void _reboot() {
    setState(() {
      _win = null;
      _board?.reboot();
    });
  }

  void _onOpen(Camp camp) {
    if (_win != null) {
      return;
    }
    if (camp.marked) {
      return;
    }
    setState(() {
      try {
        camp.open();
        if (_board!.solved) {
          _win = true;
        }
      } on ExplodException {
        _win = false;
        _board?.showBombs();
      }
    });
  }

  void _onChangeMark(Camp camp) {
    if (_win != null) {
      return;
    }
    setState(() {
      camp.changeMark();
      if (_board!.solved) {
        _win = true;
      }
    });
  }

  Board _getBoard(double width, double height) {
    if (_board == null) {
      int qtColumns = 15;
      double sizeCamp = width / qtColumns;
      int qtRows = (height / sizeCamp).floor();

      _board = Board(
        rows: qtRows,
        columns: qtColumns,
        qtBombs: (qtRows * qtColumns * 0.15).floor(),
      );
      return _board!;
    } else {
      return _board!;
    }
  }

  @override
  Widget build(BuildContext context) {
    Camp camp = Camp(row: 0, column: 0);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultWidget(
          win: _win,
          onReboot: _reboot,
        ),
        body: Container(
          child: LayoutBuilder(
            builder: ((context, constraints) {
              return BoardWidget(
                board: _getBoard(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
                onOpen: _onOpen,
                onChangeMark: _onChangeMark,
              );
            }),
          ),
        ),
      ),
    );
  }
}
