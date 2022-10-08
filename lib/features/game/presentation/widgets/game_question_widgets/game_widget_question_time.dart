
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kaito/core/utils/constants.dart';

import '../../cubit/game_cubit.dart';


class GameWidgetQuestionTime extends StatefulWidget {
  const GameWidgetQuestionTime({Key? key}) : super(key: key);

  @override
  State<GameWidgetQuestionTime> createState() => _GameWidgetQuestionTimeState();
}

class _GameWidgetQuestionTimeState extends State<GameWidgetQuestionTime> with TickerProviderStateMixin {

  AnimationController? _controller;

  void repeatOnce() async {
    await _controller!.forward();
    await BlocProvider.of<GameCubit>(context).answerQuestion();
    setState(() {});
  }


  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
    repeatOnce();

    return AnimatedBuilder(
        animation: _controller!,
        builder: (ctx, child) => Stack(
          children: [
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
            Container(
              width: Tween<double>(begin: 0, end: Constants().width(context))
                  .animate(_controller!).value,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green,
              ),
            ),
          ],
        ));
  }
}
