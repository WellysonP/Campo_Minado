import 'package:campo_minado/components/camp_widget.dart';
import 'package:campo_minado/components/result_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/camp.dart';

class MinedCampApp extends StatelessWidget {
  const MinedCampApp({Key? key}) : super(key: key);

  void _reboot() {
    print("reiniciado");
  }

  void _onOpen(Camp camp) {
    print("Aberto");
  }

  void _onChangeMark(Camp camp) {
    print("Alternado");
  }

  @override
  Widget build(BuildContext context) {
    Camp camp = Camp(row: 0, column: 0);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultWidget(
          win: null,
          onReboot: _reboot,
        ),
        body: Container(
          child: CampWidget(
            camp: camp,
            onOpen: _onOpen,
            onChangeMark: _onChangeMark,
          ),
        ),
      ),
    );
  }
}
