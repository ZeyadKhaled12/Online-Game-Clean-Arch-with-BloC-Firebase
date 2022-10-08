
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/core/utils/assets_manager.dart';


import '../../../../room/presentation/cubit/room_cubit.dart';
import '../../cubit/game_cubit.dart';
import 'game_widget_answer.dart';


class GameWidgetAnswerListView extends StatelessWidget {
  const GameWidgetAnswerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
          width: double.infinity,
          child:  BlocBuilder<GameCubit, GameState>(
              builder: (_, gameState) {
                return BlocBuilder<RoomCubit, RoomState>(builder: (_, roomState){

                  List _listAnswers = BlocProvider.of<GameCubit>(context).answersList;
                  List<Map> _dataGamersInTokens = BlocProvider.of<RoomCubit>(context).dataGamersInRoom;

                  return ListView.builder(
                      itemBuilder: (ctx, index) {
                        return GameWidgetAnswer(
                          question: _listAnswers[index]['question'][BlocProvider
                              .of<GameCubit>(context).languageCode],
                          imgUrl: _dataGamersInTokens[_listAnswers[index]['index']]['avatar_path'],
                          gamerName: _dataGamersInTokens[_listAnswers[index]['index']]['name'],
                          answerQuestion: _listAnswers[index]['answer'],
                        );
                      },
                      itemCount: _listAnswers.length);
                });
              })),
    );
  }
}


