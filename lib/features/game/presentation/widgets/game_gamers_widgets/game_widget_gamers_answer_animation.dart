
import 'package:flutter/material.dart';
import 'package:kaito/core/utils/app_colors.dart';

import '../../../../../core/utils/general_widgets/animation_widget_opacity.dart';

class GameWidgetGamersAnswerAnimation extends StatelessWidget {
  const GameWidgetGamersAnswerAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const int _seconds = 3;

    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 110),
        duration: const Duration(seconds: _seconds),
        builder: (ctx, value, widget){
          return AnimationWidgetOpacity(
            widgetOpacity: Container(
              padding: EdgeInsets.all(value),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.green,
              ),
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 50),
                duration: const Duration(seconds: _seconds),
                builder: (ctx, value, widget){
                  return Text('Yes', style: TextStyle(
                      color: Colors.white,fontSize: value
                  ));
                },
              ),
            ),
            seconds: _seconds,
            isRevers: true
          );
        },
      )
    );
  }
}
