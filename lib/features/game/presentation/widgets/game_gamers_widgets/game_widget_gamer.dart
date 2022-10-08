import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kaito/core/utils/constants.dart';
import 'package:kaito/features/game/presentation/cubit/game_cubit.dart';
import 'package:kaito/features/room/presentation/cubit/room_cubit.dart';

import '../../../../room/presentation/widgets/room_gamers_widgets/room_gamer_widgets/room_widget_gamer_pic.dart';

class GameWidgetGamer extends StatelessWidget {
  const GameWidgetGamer(
      {Key? key,
      required this.gamerName,
      required this.imgUrl,
      required this.isHisTurn,
      required this.isHiringIndexMinusOne,
      required this.function,
      required this.index, required this.isExist}) : super(key: key);
  final String gamerName;
  final String imgUrl;
  final bool isHisTurn;
  final bool isHiringIndexMinusOne;
  final Function() function;
  final int index;
  final bool isExist;

  @override
  Widget build(BuildContext context) {
    double _padding = Constants().width(context) * 1 / 5;
    return isExist? const Text(''):
    InkWell(
      onTap: isHiringIndexMinusOne ? function : null,
      child: Padding(
          padding: EdgeInsets.only(bottom: 11, left: _padding, right: _padding),
          child: SizedBox(
            width: 120,
            height: 150,
            child: Card(
              color: isHisTurn
                  ? const Color(0XFFB9C771)
                  : Theme.of(context).secondaryHeaderColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: isHiringIndexMinusOne ? 10 : 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RoomWidgetGamerPic(imageUrl: imgUrl),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Text(gamerName,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'com',
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  if (isHiringIndexMinusOne)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text('${BlocProvider.of<GameCubit>(context).kaitoTokensMap[
                        BlocProvider.of<RoomCubit>(context).gamersTokens[index]]}'
                          , style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold)),
                    )
                ],
              ),
            ),
          )),
    );
  }
}
