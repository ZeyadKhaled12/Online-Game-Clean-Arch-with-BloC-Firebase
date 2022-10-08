
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';


class RoomWidgetBottomBtnStart extends StatelessWidget {
  const RoomWidgetBottomBtnStart({Key? key,
    required this.startFun}) : super(key: key);
  final Function() startFun;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 80,
        child: ElevatedButton(
          child: Text('Start', style: TextStyle(
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'com'
          )),
          onPressed: startFun,
          style: ElevatedButton.styleFrom(
              primary: AppColors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
              ),
              elevation: 20,
              shadowColor: Colors.green
          ),
        ),
      ),
    );
  }
}
