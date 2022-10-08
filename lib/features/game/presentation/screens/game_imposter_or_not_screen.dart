
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundpool/soundpool.dart';

import '../../../../config/routes/routes_names.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/general_widgets/animation_widget_opacity.dart';
import '../../../room/presentation/cubit/room_cubit.dart';
import '../../../splash/presentation/cubit/splash_cubit.dart';
import '../cubit/game_cubit.dart';




class GameImposterOrNotScreen extends StatefulWidget {
  const GameImposterOrNotScreen({Key? key}) : super(key: key);

  @override
  _GameImposterOrNotScreenState createState() => _GameImposterOrNotScreenState();
}

class _GameImposterOrNotScreenState extends State<GameImposterOrNotScreen> {

  Future _setBackGroundMusic() async{
    Soundpool pool = Soundpool(streamType: StreamType.notification);
    int soundId = await rootBundle.load(AudioAssets.gameStartSound)
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    await pool.play(soundId);
  }

  @override
  void initState() {
    _setBackGroundMusic();
    Future.delayed(const Duration(seconds: 5), () async{
      await BlocProvider.of<RoomCubit>(context).updateGameStart();
      await Navigator.pushReplacementNamed(context, RoutesNames.gameScreen);
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: RadialGradient(colors: [
                AppColors.button,
                Colors.black
              ],  radius: 0.8)
          ),
          child:  AnimationWidgetOpacity(
            seconds: 4,
            widgetOpacity: BlocBuilder<GameCubit, GameState>(
              builder: (_, gameState){
                return
                  BlocProvider.of<SplashCubit>(context).androidId ==
                      BlocProvider.of<GameCubit>(context).kaitoToken?
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage(ImgAssets.logoPath), height: 150),
                    Text('You are kaito', style: TextStyle(
                        color: Theme.of(context).textSelectionTheme.selectionColor,
                        fontFamily: 'com', fontSize: 22,
                        fontWeight: FontWeight.bold))
                  ],
                ):
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(BlocProvider.of<GameCubit>(context).objectCategory[BlocProvider
                          .of<GameCubit>(context).languageCode],
                          style: TextStyle(color: Theme.of(context).textSelectionTheme.selectionColor,
                          fontFamily: 'com', fontSize: 22,
                          fontWeight: FontWeight.bold))
                    ],
                  );
              },
            ),
          )
      ),
    );
  }
}
