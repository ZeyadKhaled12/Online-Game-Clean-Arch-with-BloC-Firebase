
import 'package:flutter/material.dart';
import 'package:kaito/core/utils/app_colors.dart';
import 'package:kaito/core/utils/assets_manager.dart';
import 'cj_room_dialog_create_widgets/cj_room_widget_dialog_create.dart';


import 'cj_room_widget_dialog_button.dart';
import 'cj_room_widget_dialog_join.dart';
import 'cj_room_widget_dialog_template.dart';




class CJRoomWidgetInitDialog extends StatelessWidget {
  const CJRoomWidgetInitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CJRoomWidgetDialogButton(
            imagePath: ImgAssets.joinRoomPath,
            title: 'Join room',
            function: (){
              showDialog(context: context, builder: (ctx){
                return const CJRoomWidgetDialogTemplate(
                  content: CJRoomWidgetDialogJoin(),
                  title: 'Please enter a code to join the room',
                );
              });
            }),
        const Padding(padding: EdgeInsets.only(top: 29)),
        CJRoomWidgetDialogButton(
            imagePath: ImgAssets.createRoomPath,
            title: 'Create room',
            function: (){
              showDialog(context: context, builder: (ctx){
                return const CJRoomWidgetDialogTemplate(
                  content: CJRoomWidgetDialogCreate(),
                  title: 'To play with friends, send them the room code:',
                );
              });
            },
            buttonColor: AppColors.green)
      ],
    );
  }
}
