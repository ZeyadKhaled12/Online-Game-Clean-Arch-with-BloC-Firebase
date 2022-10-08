
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';


class GameWidgetBottom extends StatefulWidget {
  const GameWidgetBottom({Key? key,
    required this.microphoneFun,
    required this.answerListFun}) : super(key: key);
  final Function() microphoneFun;
  final Function() answerListFun;

  @override
  State<GameWidgetBottom> createState() => _GameWidgetBottomState();
}

class _GameWidgetBottomState extends State<GameWidgetBottom> {

  final IconData _iconData  = Icons.chat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            child: Text('Answers list', style: TextStyle(
                color: Theme.of(context).textSelectionTheme.selectionColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'com'
            )),
            onPressed: widget.answerListFun,
            style: ElevatedButton.styleFrom(
                primary: AppColors.button,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 10,
            ),
          ),
          ElevatedButton(
            child: Icon(_iconData,
                color: Theme.of(context).textSelectionTheme.selectionColor, size: 24),
            onPressed: widget.microphoneFun,
            style: ElevatedButton.styleFrom(
              primary: AppColors.button,
              fixedSize: const Size(54, 54),
              shape: const CircleBorder(),
              elevation: 8,
            ),
          )
        ],
      ),
    );
  }
}
