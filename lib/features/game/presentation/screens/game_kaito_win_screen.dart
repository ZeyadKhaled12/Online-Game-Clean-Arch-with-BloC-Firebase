
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/config/routes/routes_names.dart';
import 'package:kaito/features/game/presentation/cubit/game_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/general_widgets/animation_widget_opacity.dart';
import '../../../room/presentation/cubit/room_cubit.dart';
import '../widgets/game_widget_alert_play_again.dart';

class GameKaitoWinScreen extends StatefulWidget {
  const GameKaitoWinScreen({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  _GameKaitoWinScreenState createState() => _GameKaitoWinScreenState();
}

class _GameKaitoWinScreenState extends State<GameKaitoWinScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  colors: [AppColors.button, Colors.black], radius: 0.8)),
          width: double.infinity,
          height: double.infinity,
          child: AnimationWidgetOpacity(
            widgetOpacity: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Image(image: NetworkImage(
                      '${BlocProvider.of<RoomCubit>(context)
                          .dataGamersInRoom[BlocProvider
                          .of<RoomCubit>(context).gamersTokens
                          .indexOf(widget.token)]['avatar_path']}'),
                      height: 90),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        '${BlocProvider.of<RoomCubit>(context).dataGamersInRoom
                        [BlocProvider.of<RoomCubit>(context).gamersTokens.indexOf(widget.token)]['name']} ',
                        style: TextStyle(
                            color: Theme.of(context)
                                .textSelectionTheme
                                .selectionColor,
                            fontFamily: 'com',
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    const Padding(padding: EdgeInsets.only(right: 10)),
                    const Text('Win',
                        style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'com',
                            fontSize: 18,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                const Text('He was kaito',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 22,
                        fontFamily: 'com',
                        fontWeight: FontWeight.bold))
              ],
            ),
            seconds: 3,
            onEnd: () {

              Future.delayed(const Duration(seconds: 4), () async {
                await BlocProvider.of<GameCubit>(context).countKaitoToken(token: widget.token);
                if(BlocProvider.of<RoomCubit>(context).isSearchGame) {
                  Navigator.pushReplacementNamed(context, RoutesNames.profileScreen);
                }else{
                  showDialog(context: context,
                      builder: (ctx) {return const GameWidgetAlertPlayAgain();},
                      barrierDismissible: false);
                }
              });
            },
          )),
    );
  }
}
