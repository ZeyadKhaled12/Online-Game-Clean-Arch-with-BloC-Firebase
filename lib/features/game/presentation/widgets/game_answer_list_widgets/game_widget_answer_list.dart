
import 'package:flutter/material.dart';
import 'package:kaito/core/utils/app_colors.dart';
import 'package:kaito/core/utils/constants.dart';

import 'game_widget_answer_list_view.dart';



class GameWidgetAnswerList extends StatelessWidget {
  const GameWidgetAnswerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: const BoxDecoration(
          color: AppColors.button,
          borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20)
        )
      ),
      height: Constants().height(context) - (Constants().height(context) * 1/4),
      width: double.infinity,
      child: Column(
        children: const [
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('Answers list', style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'com',
            fontWeight: FontWeight.bold
          )),
          Expanded(
              child: GameWidgetAnswerListView())
        ],
      ),
    );
  }
}
