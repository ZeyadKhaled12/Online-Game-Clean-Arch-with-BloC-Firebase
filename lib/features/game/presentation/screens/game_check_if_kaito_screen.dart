
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/routes_names.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/general_widgets/animation_widget_opacity.dart';
import '../../../room/presentation/cubit/room_cubit.dart';
import '../cubit/game_cubit.dart';
import '../widgets/game_check_if_kaito_widgets/game_widget_cik_kaito_or_not.dart';
import '../widgets/game_check_if_kaito_widgets/game_widget_cik_skipping.dart';
import '../widgets/game_widget_alert_play_again.dart';
import 'game_kaito_win_screen.dart';

class GameCheckIfKaitoScreen extends StatefulWidget {
  const GameCheckIfKaitoScreen({Key? key, required this.token})
      : super(key: key);
  final String token;

  @override
  _GameCheckIfKaitoScreenState createState() => _GameCheckIfKaitoScreenState();
}

class _GameCheckIfKaitoScreenState extends State<GameCheckIfKaitoScreen> {

  _refresh(bool isSkipped) async {
    await BlocProvider.of<GameCubit>(context).roundPLusPLus();
    if (!isSkipped) {
      await BlocProvider.of<GameCubit>(context)
          .gamersExistsListFun(widget.token);
    }
    await BlocProvider.of<GameCubit>(context).setDataGame(ctx: context);
  }

  _kaitoWin() async {
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => GameKaitoWinScreen(
                token: BlocProvider.of<GameCubit>(context).kaitoToken
            )
        )
    );
  }

  final int _seconds = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  colors: [AppColors.button, Colors.black], radius: 0.8)),
          child: widget.token.isEmpty
              ? AnimationWidgetOpacity(
                  seconds: 3,
                  onEnd: () async {
                    await _refresh(true);
                    Future.delayed(Duration(seconds: _seconds), () async {
                      if (BlocProvider.of<GameCubit>(context).round == BlocProvider
                          .of<RoomCubit>(context).limitRounds) {
                        await _kaitoWin();
                      } else {
                        await Navigator.pushReplacementNamed(
                            context, RoutesNames.gameScreen);
                      }
                    });
                  },
                  widgetOpacity: const GameWidgetCikSkipping())
              : AnimationWidgetOpacity(
                  seconds: 3,
                  onEnd: () {
                    Future.delayed(Duration(seconds: _seconds), () async {
                      if (BlocProvider.of<GameCubit>(context).kaitoToken == widget.token) {
                        if(BlocProvider.of<RoomCubit>(context).isSearchGame) {
                          Navigator.pushReplacementNamed(context, RoutesNames.profileScreen);
                        }else{
                          showDialog(context: context,
                              builder: (ctx) {return const GameWidgetAlertPlayAgain();},
                              barrierDismissible: false);
                        }
                      } else {
                        await _refresh(false);
                        if (BlocProvider.of<GameCubit>(context).round == BlocProvider
                            .of<RoomCubit>(context).limitRounds ||
                            BlocProvider.of<RoomCubit>(context).gamersTokens
                                .length - BlocProvider.of<GameCubit>(context).gamersExistsList.length <= 2)
                        {
                          await _kaitoWin();
                        } else {await Navigator.pushReplacementNamed(
                              context, RoutesNames.gameScreen);}}
                    });
                  },
                  widgetOpacity: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<RoomCubit, RoomState>(
                        builder: (_, roomState) {
                          return GameWidgetCikKaitoOrNot(
                            isKaito: BlocProvider.of<GameCubit>(context).kaitoToken == widget.token,
                            name: BlocProvider.of<RoomCubit>(context).dataGamersInRoom[
                                  BlocProvider.of<RoomCubit>(context).gamersTokens
                                      .indexOf(widget.token)]['name'],
                            imageUrl: BlocProvider.of<RoomCubit>(context)
                                .dataGamersInRoom[BlocProvider.of<RoomCubit>(context)
                                .gamersTokens.indexOf(widget.token)]['avatar_path'],
                          );
                        },
                      )
                    ],
                  ),
                )),
    );
  }
}
