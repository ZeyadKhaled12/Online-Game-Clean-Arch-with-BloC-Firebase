

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../room/presentation/cubit/room_cubit.dart';
import '../../../room/presentation/widgets/room_widget_arrow_back.dart';
import '../../../room/presentation/widgets/room_widget_copy_btn.dart';
import '../widgets/game_widget_stream.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        actions: [RoomWidgetCopyBtn(title: '${BlocProvider.of<RoomCubit>(context).name} #${
            BlocProvider.of<RoomCubit>(context).id}')],
        leading: const RoomWidgetArrowBack(
          title: 'Are you sure you want leave game?',
        ),
        title: Text('${BlocProvider.of<RoomCubit>(context).name} #${BlocProvider
            .of<RoomCubit>(context).id}',
            style: TextStyle(
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontSize: 22,
            )),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
          Theme.of(context).secondaryHeaderColor,
          Theme.of(context).primaryColor,
        ])),
        child: GameWidgetStream()
      ),
    );
  }
}
