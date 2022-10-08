
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../room/presentation/cubit/room_cubit.dart';
import '../../cubit/game_cubit.dart';

import 'game_widget_gamers_list_view.dart';


class GameWidgetGamersList extends StatefulWidget {
  const GameWidgetGamersList({Key? key}) : super(key: key);


  @override
  State<GameWidgetGamersList> createState() => _GameWidgetGamersListState();
}


class _GameWidgetGamersListState extends State<GameWidgetGamersList> {

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: BlocBuilder<GameCubit, GameState>(

        builder: (_, gameState){
          return BlocBuilder<RoomCubit, RoomState>(builder: (_, roomState){
            List<Map<String, dynamic>> _gamersData = List.of(BlocProvider
                .of<RoomCubit>(context).dataGamersInRoom);

            int _hiringIndex = BlocProvider.of<GameCubit>(context).hiringIndex;

            if(_hiringIndex != -1) {
              _gamersData.insert(0, _gamersData[_hiringIndex]);
              _gamersData.removeAt(_hiringIndex + 1);
            }

            return  Stack(
              children: [
                GameWidgetGamersListView(
                  hiringIndex: _hiringIndex,
                  gamersData: _gamersData),
                //const GameWidgetGamersAnswerAnimation()
              ],
            );
          });
        },
      ),
    );
  }
}
