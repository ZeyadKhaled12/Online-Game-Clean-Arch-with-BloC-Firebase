

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constants.dart';


class CJRoomWidgetDialogButton extends StatelessWidget {
  const CJRoomWidgetDialogButton({Key? key,
    this.imagePath,
    required this.title,
    required this.function,
    this.circular = 20,
    this.elevation = 0,
    this.padding = 0,
    this.width = double.infinity,
    this.buttonColor = AppColors.button}) : super(key: key);
  final String? imagePath;
  final String title;
  final Function() function;
  final Color buttonColor;
  final double circular;
  final double elevation;
  final double padding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        child: imagePath == null?
        Text(
          title, style: TextStyle(fontFamily: 'com', fontSize: 22,
        color: Theme.of(context).textSelectionTheme.selectionColor),
        ):
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CircleAvatar(
                child: Image(image: AssetImage(imagePath!),
                  width: 44,
                  height: 44,
                ),
                radius: 22,
                backgroundColor: Theme.of(context).textSelectionTheme.selectionColor?.withOpacity(0.4),
              ),
            ),

            Expanded(
              child: Text(
                title, style: TextStyle(fontFamily: 'com', fontSize: 22,
                color: Theme.of(context).textSelectionTheme.selectionColor
              ),
              ),
            )
          ],
        ),
        onPressed: () async{
          await Constants().audioOnClickButton();
          function();
        },
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          padding: EdgeInsets.only(left: padding, right: padding),
          fixedSize: imagePath == null?null:const Size(80, 80),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(circular)),
          elevation: elevation,
        ),
      ),
    );
  }
}
