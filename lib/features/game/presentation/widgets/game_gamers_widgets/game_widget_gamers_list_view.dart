
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../room/presentation/cubit/room_cubit.dart';
import '../../../../splash/presentation/cubit/splash_cubit.dart';
import '../../cubit/game_cubit.dart';
import 'game_widget_gamer.dart';
import 'game_widget_gamers_list_time.dart';

class GameWidgetGamersListView extends StatelessWidget {
  const GameWidgetGamersListView(
      {Key? key, required this.hiringIndex, required this.gamersData})
      : super(key: key);
  final List<Map<String, dynamic>> gamersData;
  final int hiringIndex;

  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            if(hiringIndex == -1)
              Column(
                children: const [
                  Padding( padding: EdgeInsets.only(bottom: 10),
                      child: Text('Vote who is kaito?', style: TextStyle(
                          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold,
                          fontFamily: 'com'))),
                  GameWidgetGamersListTime()
                ],
              ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    String _gamerToken =  BlocProvider.of<RoomCubit>(context).gamersTokens[index];
                    return hiringIndex == -1 && _gamerToken == BlocProvider.of<SplashCubit>
                      (context).androidId?
                    const Text(''):
                    GameWidgetGamer(
                      index: index,
                      isExist: BlocProvider.of<GameCubit>(context).gamersExistsList
                          .contains(_gamerToken),
                      function: () async{
                        await Constants().audioOnClickButton();
                        await BlocProvider.of<GameCubit>(context).indexKaitoChosenFun(
                            ctx: context, index: index);
                      },
                      isHiringIndexMinusOne: hiringIndex == -1,
                      gamerName: gamersData[index]['name'],
                      imgUrl: gamersData[index]['avatar_path'],
                      isHisTurn: hiringIndex != -1 && index == 0 ||
                          BlocProvider.of<GameCubit>(context).indexKaitoChosen == index,
                    );
                  },
                  itemCount: gamersData.length),
            )
          ],
        ));
  }
}
