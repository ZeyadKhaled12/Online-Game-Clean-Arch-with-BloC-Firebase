
import 'package:flutter/material.dart';

class ProfileSFGWidgetDialogBtn extends StatelessWidget {
  const ProfileSFGWidgetDialogBtn({Key? key,
    required this.function}) : super(key: key);
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          padding: const EdgeInsets.all(15)
        ),
        onPressed:function,
        child: const Text('Search', style: TextStyle(color: Colors.white, fontFamily: 'com',
          fontSize: 22
        )),
      ),
    );
  }
}
