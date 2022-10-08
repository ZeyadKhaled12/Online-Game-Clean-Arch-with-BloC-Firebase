
import 'package:flutter/material.dart';

import '../../../screens/profile_sfg_screen.dart';
import 'profile_sfg_widget_dialog_btn.dart';
import 'profile_sfg_widget_dialog_radio.dart';

class ProfileSFGWidgetDialog extends StatefulWidget {
  const ProfileSFGWidgetDialog({Key? key}) : super(key: key);

  @override
  State<ProfileSFGWidgetDialog> createState() => _ProfileSFGWidgetDialogState();
}

class _ProfileSFGWidgetDialogState extends State<ProfileSFGWidgetDialog> {

  int _value = -1;
  final List _values = [3, 5, 8, 10];

  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(4, (index) => ProfileSFGWidgetDialogRadio(
              groupValue: _value,
              value: _values[index],
              onChanged: (val){
                setState(() {
                  _value =  val!;
                });
              },
            ))
        ),
        ProfileSFGWidgetDialogBtn(
          function: () async{
            if(_value != -1) {
              Navigator.of(context).pop();
              await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                      ProfileSFGScreen(capacity: _value)));
            }
          }
        )
      ],
    );
  }
}

