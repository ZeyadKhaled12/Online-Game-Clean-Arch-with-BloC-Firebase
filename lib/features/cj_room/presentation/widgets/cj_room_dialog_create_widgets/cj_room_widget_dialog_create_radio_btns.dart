
import 'package:flutter/material.dart';
import 'package:kaito/core/utils/app_colors.dart';
import 'package:kaito/features/cj_room/presentation/widgets/cj_room_dialog_create_widgets/cj_room_widget_dialog_create_radio_btn.dart';





class CJRoomWidgetDialogCreateRadioBtns extends StatelessWidget{
  const CJRoomWidgetDialogCreateRadioBtns({Key? key, required this.groupValue,
    required this.function}) : super(key: key);
  final int groupValue;
  final Function(Object? val) function;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CJRoomWidgetDialogCreateRadioBtn(function:function,
            index: 0, groupValue: groupValue, title: 'room(3)'),
        CJRoomWidgetDialogCreateRadioBtn(function: function,
            index: 1, groupValue: groupValue, title: 'room(5)'),
        CJRoomWidgetDialogCreateRadioBtn(function: function,
            index: 2, groupValue: groupValue, title: 'room(8)'),
      ],
    );
  }
}


/*
(val){
          setState(() {
            _groupValue = int.parse(val.toString());
          });
        }
 */