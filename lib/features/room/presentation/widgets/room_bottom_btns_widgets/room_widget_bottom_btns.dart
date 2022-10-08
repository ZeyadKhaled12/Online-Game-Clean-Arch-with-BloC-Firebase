
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../splash/presentation/cubit/splash_cubit.dart';
import '../../cubit/room_cubit.dart';
import 'room_widget_bottom_btn_microphone.dart';
import 'room_widget_bottom_btn_start.dart';



class RoomWidgetBottomBtns extends StatelessWidget {
  const RoomWidgetBottomBtns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 20),
      child: BlocBuilder<RoomCubit, RoomState>(
        builder: (_, roomState) {
          return Row(
            children: [
              const RoomWidgetBottomBtnMicroPhone(),
              const Padding(padding: EdgeInsets.only(left: 25)),
              if (BlocProvider.of<RoomCubit>(context).ownerToken ==
                  BlocProvider.of<SplashCubit>(context).androidId)
                RoomWidgetBottomBtnStart(startFun: () async {
                  if (BlocProvider.of<RoomCubit>(context).gamersTokens.length !=
                      BlocProvider.of<RoomCubit>(context).capacityRoom) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Room must be full to start!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'com')),
                        backgroundColor: Colors.black));
                  } else {
                    await BlocProvider.of<RoomCubit>(context).startGameInRoom();
                  }
                })
            ],
          );
        },
      ),
    );
  }
}
