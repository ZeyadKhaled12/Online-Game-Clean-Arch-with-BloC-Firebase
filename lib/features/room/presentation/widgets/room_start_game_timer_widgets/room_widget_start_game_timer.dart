
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../cubit/room_cubit.dart';


class RoomWidgetStartGameTimer extends StatefulWidget {
  const RoomWidgetStartGameTimer({Key? key}) : super(key: key);

  @override
  State<RoomWidgetStartGameTimer> createState() => _RoomWidgetStartGameTimerState();
}

class _RoomWidgetStartGameTimerState extends State<RoomWidgetStartGameTimer> with
    TickerProviderStateMixin{

  AnimationController? _controller;
  int _count = 6;

  void repeatOnce() async {
    await _controller!.forward();
    setState(() {_count = _count - 1;});
    if(_count <= 0){
      await BlocProvider.of<RoomCubit>(context).startGameInRoom();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat();
    repeatOnce();

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: AnimatedBuilder(
          animation: _controller!,
          builder: (ctx, child) =>
             Opacity(opacity: Tween<double>(begin: 1, end: 0).animate(_controller!).value,
               child:  Text('$_count',
                   style: TextStyle(color: AppColors.green,
                       fontFamily: 'com',
                       fontSize: Tween<double>(begin: 50, end: 250)
                           .animate(_controller!).value)),
             )
        ),
      )
    );
  }
}