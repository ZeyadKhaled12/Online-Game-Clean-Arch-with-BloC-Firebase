
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/game_cubit.dart';


class GameWidgetGamersListTime extends StatefulWidget {
  const GameWidgetGamersListTime({Key? key}) : super(key: key);


  @override
  State<GameWidgetGamersListTime> createState() => _GameWidgetGamersListTimeState();
}

class _GameWidgetGamersListTimeState extends State<GameWidgetGamersListTime>
    with TickerProviderStateMixin{

  AnimationController? _controller;

  void _repeatOnce() async {
    await _controller!.forward();
    BlocProvider.of<GameCubit>(context).knowImposterIfTrue(
      ctx: context);
    await BlocProvider.of<GameCubit>(context).setDataGame(ctx: context);
  }


  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 28))..repeat();
    _repeatOnce();
    return AnimatedBuilder(
        animation: _controller!,
        builder: (ctx, child) => Text('00:${
            Tween<double>(begin: 29, end: 0)
                .animate(_controller!).value.round()}', style: const TextStyle(color: Colors.white
            , fontSize: 20)));
  }
}
