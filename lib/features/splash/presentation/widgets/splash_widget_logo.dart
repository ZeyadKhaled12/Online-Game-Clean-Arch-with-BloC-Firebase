
import 'package:flutter/material.dart';
import 'package:kaito/core/utils/app_strings.dart';
import 'package:kaito/core/utils/assets_manager.dart';


class SplashWidgetLogo extends StatelessWidget {
  const SplashWidgetLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            backgroundColor: Theme
                .of(context)
                .secondaryHeaderColor,
            child: const Image(image: AssetImage(ImgAssets.logoPath)),
            radius: 42),
        const Padding(padding: EdgeInsets.only(right: 10)),
        Text(AppStrings.appName,
            style: TextStyle(
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontSize: 38,
              fontFamily: 'com',
            )),
      ],
    );
  }
}
