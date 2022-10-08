
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/core/utils/app_colors.dart';
import 'package:kaito/core/utils/assets_manager.dart';

import '../../../../splash/presentation/cubit/splash_cubit.dart';
import '../../../data/web_services/room_operations_web_services.dart';
import '../../cubit/room_cubit.dart';
import 'room_gamer_widgets/room_widget_gamer.dart';


class RoomWidgetGamersListView extends StatelessWidget {
  const RoomWidgetGamersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.button,
          ),

          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('rooms')
                .doc(BlocProvider.of<RoomCubit>(context).id)
                .snapshots(),
            builder: (ctx, snapShot) {
              if (snapShot.connectionState != ConnectionState.waiting) {

                RoomOperationsWebServices _roomOperationsWebServices = RoomOperationsWebServices();
                _roomOperationsWebServices.operationsInListView(
                    ownerToken: snapShot.data!['owner_token'],
                    isGameStart: snapShot.data!['is_game_start'],
                    gamersTokens: snapShot.data!['gamers_tokens'],
                    ctx: context);
              }

              return BlocBuilder<RoomCubit, RoomState>(
                builder: (_, roomState) {
                  List _gamersTokens =
                      BlocProvider.of<RoomCubit>(context).gamersTokens;

                  return ListView.builder(
                      itemBuilder: (ctx, index) {
                        Map<String, dynamic> _map =
                            BlocProvider.of<RoomCubit>(context)
                                .dataGamersInRoom[index];
                        if (index >= BlocProvider.of<RoomCubit>(context).gamersTokens.length) {
                          return const Text('');
                        }
                        return RoomWidgetGamer(
                            imageUrl: _map['avatar_path'],
                            index: index,
                            gamerName: _map['name'],
                            winCount: _map['win_count'],

                            isOwner: _gamersTokens[index] == BlocProvider.of<SplashCubit>(context).androidId,
                            isOwnerOwner: BlocProvider.of<SplashCubit>(context)
                                    .androidId ==
                                BlocProvider.of<RoomCubit>(context).ownerToken,

                            isOwnerRoom: _gamersTokens[index] == BlocProvider.of<RoomCubit>(context)
                                .ownerToken
                        );
                      },
                      itemCount: BlocProvider.of<RoomCubit>(context).dataGamersInRoom.length);
                },
              );
            },
          )),
    );
  }
}
