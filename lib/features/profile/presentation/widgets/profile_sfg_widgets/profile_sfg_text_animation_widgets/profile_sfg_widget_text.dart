import 'package:flutter/material.dart';

import '../../../../../../core/utils/general_widgets/animation_widget_opacity.dart';

class ProfileSFGWidgetText extends StatelessWidget {
  const ProfileSFGWidgetText(
      {Key? key,
      required this.seconds,
      required this.color,
      required this.opacity,
      required this.text})
      : super(key: key);
  final int seconds;
  final Color color;
  final int opacity;
  final String text;

  @override
  Widget build(BuildContext context) {
    return opacity == 3
        ? Opacity(
            opacity: 0,
            child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(text,
                    style: TextStyle(
                        color: color,
                        fontSize: 26,
                        fontWeight: FontWeight.bold))),
          )
        : AnimationWidgetOpacity(
            isRevers: opacity == 1 ? true : false,
            widgetOpacity: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(text,
                    style: TextStyle(
                        color: color,
                        fontSize: 26,
                        fontWeight: FontWeight.bold))),
            seconds: seconds);
  }
}
