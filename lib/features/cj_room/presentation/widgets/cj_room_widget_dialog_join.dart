
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/config/routes/routes_names.dart';

import '../../../room/presentation/cubit/room_cubit.dart';
import '../../../room/presentation/screens/room_screen.dart';
import 'cj_room_dialog_create_widgets/cj_room_widget_dialog_create_txt_field.dart';
import 'cj_room_widget_dialog_button.dart';



class CJRoomWidgetDialogJoin extends StatefulWidget {
  const CJRoomWidgetDialogJoin({Key? key}) : super(key: key);

  @override
  State<CJRoomWidgetDialogJoin> createState() => _CJRoomWidgetDialogJoinState();
}

class _CJRoomWidgetDialogJoinState extends State<CJRoomWidgetDialogJoin> {

  bool _isError = false;

  Map _message = {'error': ''};

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CJRoomWidgetDialogCreateTxtField(
            length: 6,
            hintText: 'Code', isError: _isError, controller: _controller,
            message: _message['error'],
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          BlocBuilder<RoomCubit, RoomState>(builder: (_, roomState) {
            return CJRoomWidgetDialogButton(
              title: 'Join',
              circular: 15,
              elevation: 8,
              padding: 40,
              width: null,
              function: () async {
                if (_controller.text.contains(RegExp("[a-zA-Z0-9]"))) {
                  _message = await BlocProvider.of<RoomCubit>(context)
                      .joinRoom(id: _controller.text, ctx: context);

                  if(!_message.containsKey('error')) {
                    Navigator.pop(context); Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, RoutesNames.roomScreen);}
                  else{setState(() {_isError = true;});}
              }
                else {
                  setState(() {
                    _isError = true;
                    _message['error'] = 'This field is required';
                  });
                }
              },
            );
          })
        ],
      ),
    );
  }
}
