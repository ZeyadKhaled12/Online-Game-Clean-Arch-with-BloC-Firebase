
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/routes_names.dart';
import '../../../game/presentation/cubit/game_cubit.dart';
import '../../../splash/presentation/cubit/splash_cubit.dart';
import '../../presentation/cubit/room_cubit.dart';

class RoomOperationsWebServices{

  Future startGame({required String id}) async{
    await FirebaseFirestore.instance.collection('rooms').doc(id).update({
      'is_game_start': true});
  }

  Future kikGamer({required String id, required int index, required ownerToken}) async{

    List _gamersTokens = await FirebaseFirestore.instance.collection('rooms').doc(id).get()
        .then((value) => value['gamers_tokens']);
    String _token  = _gamersTokens[index];
    _gamersTokens.removeAt(index);
    await FirebaseFirestore.instance.collection('rooms').doc(id).update({
      'gamers_tokens': _gamersTokens
    });
    await _checkIfOwnerTokenLeave(ownerToken: ownerToken,
        idRoom: id, gamersTokens: _gamersTokens, token: _token);
  }

  void operationsInListView({required bool isGameStart,
    required String ownerToken, required List gamersTokens,
    required BuildContext ctx}){

    if (isGameStart) {
      Future.delayed(Duration.zero, () async {
        BlocProvider.of<GameCubit>(ctx).nullGamersExistsList();
        await BlocProvider.of<GameCubit>(ctx).setDataGame(ctx: ctx);
        await Navigator.pushReplacementNamed(ctx
            , RoutesNames.gameImposterOrNotScreen);});
    }

    if(BlocProvider.of<RoomCubit>(ctx).ownerToken != ownerToken){
      Future.delayed(Duration.zero, () async {
        await BlocProvider.of<RoomCubit>(ctx)
            .updateOwnerToken(ownerToken: ownerToken);
      });
    }

    if (BlocProvider.of<RoomCubit>(ctx).gamersTokens.length !=
        gamersTokens.length) {
      Future.delayed(Duration.zero, () async {
        await BlocProvider.of<RoomCubit>(ctx)
            .updateGamersInRoom(tokens: gamersTokens, ctx: ctx);
      });
      if(!gamersTokens.contains(BlocProvider.of<SplashCubit>(ctx).androidId)){
        Future.delayed(const Duration(seconds: 0), () async{
          await Navigator.pushReplacementNamed(ctx, RoutesNames.profileScreen);
        });
      }
    }
  }

  Future leaveRoom({required String token, required String idRoom
    , required String ownerToken}) async{
    List _gamersTokens = await FirebaseFirestore.instance.collection('rooms').doc(idRoom).get()
        .then((value) => value['gamers_tokens']);
    _gamersTokens.remove(token);
    if(_gamersTokens.isEmpty){
      await FirebaseFirestore.instance.collection('rooms').doc(idRoom).delete();
      await FirebaseFirestore.instance.collection('games').doc(idRoom).delete();
    }else{
      await FirebaseFirestore.instance.collection('rooms').doc(idRoom).update({
        'gamers_tokens': _gamersTokens
      });
      await _checkIfOwnerTokenLeave(ownerToken: ownerToken,
          idRoom: idRoom, gamersTokens: _gamersTokens, token: token);
    }
  }

  Future _checkIfOwnerTokenLeave({required ownerToken, required token, required idRoom
    , required gamersTokens}) async{
    Random _random = Random();
    if( ownerToken == token) {
      await FirebaseFirestore.instance.collection('rooms').doc(idRoom).update({
      'owner_token':gamersTokens[_random.nextInt(gamersTokens.length)]});
    }
  }

}