
import 'package:flutter/material.dart';


class GameWidgetCikSkipping extends StatelessWidget {
  const GameWidgetCikSkipping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Skipping',
          style: TextStyle(
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontFamily: 'com',
              fontSize: 22,
              fontWeight: FontWeight.bold)),
    );
  }
}
