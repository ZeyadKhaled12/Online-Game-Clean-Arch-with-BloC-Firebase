
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/routes_names.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../room/presentation/cubit/room_cubit.dart';

import '../cj_room_widget_dialog_button.dart';

import 'cj_room_widget_dialog_create_txt_field.dart';

class CJRoomWidgetDialogCreate extends StatefulWidget {
  const CJRoomWidgetDialogCreate({Key? key}) : super(key: key);

  @override
  State<CJRoomWidgetDialogCreate> createState() =>
      _CJRoomWidgetDialogCreateState();
}

class _CJRoomWidgetDialogCreateState extends State<CJRoomWidgetDialogCreate> {
  final List _isErrors = [false, false, false];
  final TextEditingController _controllerRoomName = TextEditingController();
  final TextEditingController _controllerRoomCapacity = TextEditingController();
  final TextEditingController _controllerLimitRounds = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        CJRoomWidgetDialogCreateTxtField(
          hintText: 'Limit rounds',
          controller: _controllerLimitRounds,
          isError: _isErrors[2],
          isDigitsOnly: true,
          message: _isErrors[2]
              ? _controllerLimitRounds.text.isEmpty
                  ? 'This field is required'
                  : 'limit rounds must be more than 1 round'
              : '',
          length: 2,
          regExp: r'[0-9]',
        ),
        const Padding(padding: EdgeInsets.only(top: 15)),
        CJRoomWidgetDialogCreateTxtField(
          hintText: 'Capacity',
          controller: _controllerRoomCapacity,
          isError: _isErrors[0],
          isDigitsOnly: true,
          message: _isErrors[0]
              ? _controllerRoomCapacity.text.isEmpty
                  ? 'This field is required'
                  : 'room capacity must be [3-10]'
              : '',
          length: 2,
          regExp: r'[0-9]',
        ),
        const Padding(padding: EdgeInsets.only(top: 15)),
        CJRoomWidgetDialogCreateTxtField(
          hintText: 'Room name',
          length: 15,
          message: _isErrors[1] ? 'This field is required' : '',
          controller: _controllerRoomName,
          isError: _isErrors[1],
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        BlocBuilder<RoomCubit, RoomState>(builder: (_, roomState) {
          return CJRoomWidgetDialogButton(
              title: 'Create',
              function: () async {
                Constants().audioOnClickButton;
                if (_controllerRoomCapacity.text.isNotEmpty &&
                    (int.parse(_controllerRoomCapacity.text) <= 10 &&
                        int.parse(_controllerRoomCapacity.text) >= 3) &&
                    _controllerRoomName.text.contains(RegExp("[a-zA-Z]")) &&
                    int.parse(_controllerLimitRounds.text) >= 2) {
                  await BlocProvider.of<RoomCubit>(context).createRoom(
                      limitRounds: int.parse(_controllerLimitRounds.text),
                      name: _controllerRoomName.text,
                      capacityRoom: int.parse(_controllerRoomCapacity.text),
                      ctx: context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, RoutesNames.roomScreen);
                } else {
                  setState(() {
                    _isErrors[0] = _controllerRoomCapacity.text.isEmpty ||
                        !(int.parse(_controllerRoomCapacity.text) <= 10 &&
                            int.parse(_controllerRoomCapacity.text) >= 3);
                    _isErrors[1] = _controllerRoomName.text.isEmpty;
                    _isErrors[2] = _controllerLimitRounds.text.isEmpty ||
                        int.parse(_controllerLimitRounds.text) < 2;
                  });
                }
              },
              width: double.infinity,
              elevation: 8);
        }),
      ]),
    );
  }
}
