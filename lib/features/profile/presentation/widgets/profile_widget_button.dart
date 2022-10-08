import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constants.dart';

class ProfileWidgetButton extends StatelessWidget {
  const ProfileWidgetButton(
      {Key? key, required this.function,
      required this.title, required this.subTitle,
      required this.imagePath}) : super(key: key);

  final Function() function;
  final String title;
  final String subTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: double.infinity,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              child: Image(image: AssetImage(imagePath),
                width: 44,
                height: 44,
              ),
              radius: 34,
              backgroundColor: Theme.of(context).secondaryHeaderColor,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontFamily: 'com', fontSize: 25,
                      color: Theme.of(context).textSelectionTheme.selectionColor
                    ),
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(
                        fontFamily: 'com', fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
        onPressed: () async{
          await Constants().audioOnClickButton();
          function();
        },
        style: ElevatedButton.styleFrom(
          primary: AppColors.button,
          fixedSize: const Size(80, 80),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          elevation: 10,
        ),
      ),
    );
  }
}
