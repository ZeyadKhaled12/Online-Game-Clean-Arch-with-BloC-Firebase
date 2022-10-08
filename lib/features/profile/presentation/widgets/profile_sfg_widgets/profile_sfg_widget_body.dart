
import 'package:flutter/material.dart';

import 'profile_sfg_text_animation_widgets/profile_sfg_widget_text_animation.dart';
import 'profile_sfg_widget_logo.dart';

class ProfileSFGWidgetBody extends StatelessWidget {
  const ProfileSFGWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ProfileSFGWidgetLogo(),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            ProfileSFGWidgetTextAnimation()
          ],
        )
    );
  }
}
