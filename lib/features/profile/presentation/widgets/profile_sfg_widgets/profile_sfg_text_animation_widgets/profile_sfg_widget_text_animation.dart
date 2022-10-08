
import 'package:flutter/material.dart';

import 'profile_sfg_widget_text.dart';

class ProfileSFGWidgetTextAnimation extends StatefulWidget {
  const ProfileSFGWidgetTextAnimation({Key? key}) : super(key: key);

  @override
  State<ProfileSFGWidgetTextAnimation> createState() =>
      _ProfileSFGWidgetTextAnimationState();
}

class _ProfileSFGWidgetTextAnimationState
    extends State<ProfileSFGWidgetTextAnimation> with TickerProviderStateMixin {
  AnimationController? _controller;

  final int _seconds = 2;

  void repeatOnce() async {
    await _controller!.forward();
    setState(() {
      if (_opacityTurn[1] == _colorsOfDots.length - 1) {
        _opacityTurn[0] = _opacityTurn[0] + 1;
        _opacityTurn[1] = 0;
      } else {
        if (_opacityTurn[1] == 0) {
          _opacityTurn[0] = 0;
          _opacityTurn[1] = 1;
        } else {
          _opacityTurn[0] = _opacityTurn[0] + 1;
          _opacityTurn[1] = _opacityTurn[1] + 1;
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  final List<int> _opacityTurn = [0, 1];
  final List<String> _text = ['Search', 'For', 'A', 'Game'];

  final List<Color> _colorsOfDots = [
    Colors.white,
    Colors.yellow,
    Colors.pinkAccent,
    Colors.purpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: _seconds))
          ..repeat();
    repeatOnce();

    return AnimatedBuilder(
        animation: _controller!,
        builder: (ctx, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        _colorsOfDots.length,
                        (index) => ProfileSFGWidgetText(
                            text: _text[index],
                            seconds: _seconds,
                            opacity: index == _opacityTurn[0]
                                ? 1
                                : index == _opacityTurn[1]
                                    ? 2
                                    : 3,
                            color: _colorsOfDots[index])))
              ],
            ));
  }
}
