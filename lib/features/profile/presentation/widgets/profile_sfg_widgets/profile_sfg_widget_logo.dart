import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';

class ProfileSFGWidgetLogo extends StatelessWidget {
  const ProfileSFGWidgetLogo({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: const [
        SizedBox(
            width: 150,
            height: 150,
            child: CircularProgressIndicator(
              backgroundColor: Colors.purple,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
            )),
        Image(image: AssetImage(ImgAssets.logoPath),
          height: 100,
        ),
      ],
    );
  }
}
