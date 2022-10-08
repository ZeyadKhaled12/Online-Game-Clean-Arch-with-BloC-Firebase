


// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/features/chat/presentation/cubit/chat_cubit.dart';

import 'package:soundpool/soundpool.dart';

import '../../../../core/utils/assets_manager.dart';
import '../cubit/room_cubit.dart';
import '../widgets/room_bottom_btns_widgets/room_widget_bottom_btns.dart';
import '../widgets/room_gamers_widgets/room_widget_capacity.dart';
import '../widgets/room_gamers_widgets/room_widget_gamers_list_view.dart';
import '../widgets/room_start_game_timer_widgets/room_widget_start_game_timer.dart';
import '../widgets/room_widget_arrow_back.dart';
import '../widgets/room_widget_copy_btn.dart';
import '../widgets/room_widget_language_code.dart';



class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key, required this.isSearchGame}) : super(key: key);
  final bool isSearchGame;

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {

  Future _setBackGroundMusic() async{
    Soundpool pool = Soundpool(streamType: StreamType.notification);
    int soundId = await rootBundle.load(AudioAssets.backGroundSound)
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    await pool.play(soundId);
  }
  late String title;

  @override
  void initState() {
    //_setBackGroundMusic();
    title = '${BlocProvider.of<RoomCubit>(context).name} #${BlocProvider
        .of<RoomCubit>(context).id}';
    super.initState();

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: !widget.isSearchGame,
        actions: widget.isSearchGame? []:[RoomWidgetCopyBtn(title: title)],
        leading: widget.isSearchGame?null:const RoomWidgetArrowBack(
          title: 'Are you sure you want leave game?',
        ),
        title: Text(title,
            style: TextStyle(
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontSize: 22,
            )),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                const RoomWidgetLanguageCode(),
                const RoomWidgetGamersListView(),
                const RoomWidgetCapacity(),
                if(!widget.isSearchGame)
                  const RoomWidgetBottomBtns()
              ],
            ),
          ),
          if(widget.isSearchGame)
            const RoomWidgetStartGameTimer()
        ],
      ),
    );
  }
}
