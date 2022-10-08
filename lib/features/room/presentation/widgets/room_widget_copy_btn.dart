import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoomWidgetCopyBtn extends StatelessWidget {
  const RoomWidgetCopyBtn({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(
              text: title.substring(title.indexOf('#') + 1, title.length)));
        },
        icon: Icon(Icons.copy,
            color: Theme.of(context).textSelectionTheme.selectionColor,
            size: 28));
  }
}
