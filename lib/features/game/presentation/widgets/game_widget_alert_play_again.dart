
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/features/chat/presentation/cubit/chat_cubit.dart';

import '../../../../config/routes/routes_names.dart';
import '../../../room/presentation/cubit/room_cubit.dart';

class GameWidgetAlertPlayAgain extends StatefulWidget {
  const GameWidgetAlertPlayAgain({Key? key}) : super(key: key);

  @override
  State<GameWidgetAlertPlayAgain> createState() =>
      _GameWidgetAlertPlayAgainState();
}

class _GameWidgetAlertPlayAgainState extends State<GameWidgetAlertPlayAgain>
    with TickerProviderStateMixin {
  AnimationController? _controller;

  void _repeatOnce() async {
    await _controller!.forward();
    BlocProvider.of<RoomCubit>(context).leaveRoom(ctx: context);
    Navigator.pop(context);
    await Navigator.pushReplacementNamed(context, RoutesNames.profileScreen);
  }

  final double _seconds = 10;

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: _seconds.toInt()))
          ..repeat();
    _repeatOnce();
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
                animation: _controller!,
                builder: (ctx, child) => Text('00:${
                    Tween<double>(begin: _seconds, end: 0).animate(_controller!).value.round()}',
                    style: const TextStyle(color: Colors.black, fontSize: 20))),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
            Text('Play again?',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () async {
                      BlocProvider.of<ChatCubit>(context).clearChat(ctx: context);
                      Navigator.pop(context);
                      await Navigator.pushReplacementNamed(
                          context, RoutesNames.roomScreen);
                    },
                    child: const Text('Yes',
                        style: TextStyle(color: Colors.black, fontSize: 20))),
                TextButton(
                    onPressed: () async {
                      BlocProvider.of<RoomCubit>(context)
                          .leaveRoom(ctx: context);
                      Navigator.pop(context);
                      await Navigator.pushReplacementNamed(
                          context, RoutesNames.profileScreen);
                    },
                    child: const Text('No',
                        style: TextStyle(color: Colors.black, fontSize: 20)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
