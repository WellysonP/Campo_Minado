import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? win;
  final Function onReboot;

  const ResultWidget({
    Key? key,
    required this.win,
    required this.onReboot,
  }) : super(key: key);

  Color _getColor() {
    if (win == null) {
      return Colors.yellow;
    } else if (win == true) {
      return Colors.green.shade300;
    } else {
      return Colors.red.shade300;
    }
  }

  IconData _getIcon() {
    if (win == null) {
      return Icons.sentiment_satisfied;
    } else if (win == true) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
              backgroundColor: _getColor(),
              child: IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  _getIcon(),
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: () => onReboot(),
              )),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
