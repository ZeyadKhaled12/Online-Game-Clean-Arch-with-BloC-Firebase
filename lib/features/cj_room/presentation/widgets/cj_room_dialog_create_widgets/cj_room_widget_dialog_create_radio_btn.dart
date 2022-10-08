
import 'package:flutter/material.dart';



class CJRoomWidgetDialogCreateRadioBtn extends StatelessWidget {
  const CJRoomWidgetDialogCreateRadioBtn({Key? key, required this.function,
    required this.index, required this.groupValue,
    required this.title}) : super(key: key);
  final Function(Object? val) function;
  final int index;
  final int groupValue;
  final String title;



  @override
  Widget build(BuildContext context) {
    return  RadioListTile(value: index, groupValue: groupValue,
        onChanged: function,
    title: Text(title, style: const TextStyle(
        color: Colors.black, fontSize: 20
    )), tileColor: groupValue == index?
        const Color(0XFF99A6C5):null,
        activeColor: const Color(0XFF4C76D2)
    );
  }
}
