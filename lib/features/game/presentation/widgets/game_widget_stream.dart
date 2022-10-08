
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../chat/presentation/screens/chat_screen.dart';
import '../../../room/presentation/cubit/room_cubit.dart';
import '../../../room/presentation/widgets/room_widget_language_code.dart';
import '../cubit/game_cubit.dart';
import 'game_answer_list_widgets/game_widget_answer_list.dart';
import 'game_gamers_widgets/game_widget_gamers_list.dart';
import 'game_question_widgets/game_widget_question.dart';
import 'game_widget_bottom.dart';

class GameWidgetStream extends StatelessWidget {
  const GameWidgetStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('games')
          .doc(BlocProvider.of<RoomCubit>(context).id)
          .snapshots(),
      builder: (ctx, snapShot) {
        if (snapShot.connectionState != ConnectionState.waiting) {
          BlocProvider.of<GameCubit>(context).refresh();
        }
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const RoomWidgetLanguageCode(),
              const GameWidgetQuestion(
                answersList: ['Yes', 'No', 'Neither'],
              ),
              const GameWidgetGamersList(),
              GameWidgetBottom(
                  microphoneFun: () async{
                    showModalBottomSheet(
                        backgroundColor: Colors.white.withOpacity(0),
                        isScrollControlled: true,
                        enableDrag: true,
                        context: context,
                        builder: (BuildContext ctx) {
                          return const ChatScreen();
                        });
                  },
                  answerListFun: () async{
                    showModalBottomSheet(
                        backgroundColor: Colors.white.withOpacity(0),
                        isScrollControlled: true,
                        enableDrag: true,
                        context: context,
                        builder: (BuildContext ctx) {
                          return const GameWidgetAnswerList();
                        });
                  })
            ],
          ),
        );
      },
    );
  }
}
