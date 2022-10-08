
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/core/utils/app_colors.dart';

import '../../../../room/presentation/cubit/room_cubit.dart';
import '../../../../splash/presentation/cubit/splash_cubit.dart';
import '../../cubit/game_cubit.dart';
import 'game_widget_question_time.dart';


class GameWidgetQuestion extends StatelessWidget {
  const GameWidgetQuestion({Key? key, required this.answersList}) : super(key: key);
  final List answersList;

  @override
  Widget build(BuildContext context) {
    final Color _white =
        Theme.of(context).textSelectionTheme.selectionColor!.withOpacity(0.69);

    return BlocBuilder<GameCubit, GameState>(builder: (_, roomState) {

      int _hiringIndex = BlocProvider.of<GameCubit>(context).hiringIndex;

      bool _isYourTurn = _hiringIndex == -1?
      false: BlocProvider.of<RoomCubit>(context).gamersTokens[_hiringIndex] ==
              BlocProvider.of<SplashCubit>(context).androidId;

      return _hiringIndex == -1?
      const Text(''):
      Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          if(_isYourTurn)
            Text(BlocProvider.of<GameCubit>(context).question[BlocProvider
                .of<GameCubit>(context).languageCode],
              style: TextStyle(
                  color: _white, fontSize: 22, fontFamily: 'com'),
              textAlign: TextAlign.center),
          if (_isYourTurn && BlocProvider.of<GameCubit>(context).question['en'] != 'No Question' &&
              BlocProvider.of<GameCubit>(context).isAnswersShow)
            Wrap(
              children: List.generate(
                  answersList.length,
                      (index) => Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      child: ElevatedButton(
                          onPressed: () async {
                            await BlocProvider.of<GameCubit>(context)
                                .answerQuestionMapFun(
                                question: BlocProvider.of<GameCubit>(context).question,
                                answer: answersList[index]);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              primary: AppColors.green),
                          child: Text(answersList[index],
                              style: TextStyle(
                                color: _white,
                                fontSize: 18,
                              ))),
                    ),
                  )),
            ),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          const Padding(padding: EdgeInsets.only(bottom: 11)),
          const GameWidgetQuestionTime(),
          const Padding(padding: EdgeInsets.only(bottom: 8)),
        ],
      );
    });
  }
}
