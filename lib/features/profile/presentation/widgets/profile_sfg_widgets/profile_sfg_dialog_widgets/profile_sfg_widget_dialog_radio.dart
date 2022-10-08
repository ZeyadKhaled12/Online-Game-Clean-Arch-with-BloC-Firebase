import 'package:flutter/material.dart';

class ProfileSFGWidgetDialogRadio extends StatelessWidget {
  const ProfileSFGWidgetDialogRadio(
      {Key? key , required this.value, required this.onChanged
        , required this.groupValue}) : super(key: key);
  final int value;
  final Function(int? val) onChanged;
  final int groupValue;


  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        title: Text('Capacity room($value)', style: const TextStyle(
          color: Colors.black, fontSize: 16
            , fontWeight: FontWeight.bold)),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged);
  }
}
