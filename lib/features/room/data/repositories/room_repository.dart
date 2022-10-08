
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'dart:math';

import '../../../splash/presentation/cubit/splash_cubit.dart';
import '../../presentation/cubit/room_cubit.dart';
import '../models/room_model.dart';
import '../web_services/room_operations_web_services.dart';
import '../web_services/room_web_services.dart';

class RoomRepository{

  final RoomWebServices roomWebServices;
  final RoomOperationsWebServices _roomOperationsWebServices =
  RoomOperationsWebServices();

  RoomRepository(this.roomWebServices);

  Future<Map> createRoom({required String name
    , required int capacityRoom
    , required int limitRounds
    , String token = ''
    , required BuildContext ctx}) async{
    final Random _random = Random();
    String _id = '';
    if(token.isEmpty) {
      _id = '${_random.nextInt(10)}${_random.nextInt(10)}'
          '${_random.nextInt(10)}${_random.nextInt(10)}'
          '${_random.nextInt(10)}${_random.nextInt(10)}';
    }
    RoomModel _roomModel = RoomModel(name: name,
        id: token.isEmpty? _id : token,
        ownerToken: token.isEmpty?BlocProvider.of<SplashCubit>(ctx).androidId:'',
        capacityRoom: capacityRoom,
        limitRounds: limitRounds,
        isGameStart: false,
        gamersTokens: [BlocProvider.of<SplashCubit>(ctx).androidId]);
    Map<String, dynamic> _map = await roomWebServices.createRoom(map: _roomModel.toJson());
    return _map;
  }

  Future<Map<String, dynamic>> joinRoom({required String id, required BuildContext ctx}) async{
    String _userToken = BlocProvider.of<SplashCubit>(ctx).androidId;
    final Map<String, dynamic> _map = await roomWebServices.joinRoom(id: id
        , userToken: _userToken );
    if(!_map.containsKey('error')) {
      RoomModel roomModel = RoomModel.fromJson(_map);
      return roomModel.toJson();
    }
    return _map;
  }

  Future<List<Map<String, dynamic>>> getDataGamersInRoom({required BuildContext ctx}) async{
    final List<Map<String, dynamic>> _list = await roomWebServices
        .getGamersInRoom(listOfTokens: BlocProvider.of<RoomCubit>(ctx).gamersTokens);
    return _list;
  }

  Future startGame({required String roomId}) async{
    await _roomOperationsWebServices.startGame(id: roomId);
  }

  Future updateGameStart({required String idRoom}) async{
    await roomWebServices.updateGameStart(idRoom: idRoom);
  }

  Future kikGamer({required String id, required int index,
    required String ownerToken}) async{
    await _roomOperationsWebServices.kikGamer(id: id, index: index
        , ownerToken: ownerToken);
  }

  Future leaveRoom({required BuildContext ctx, required String idRoom
    , required String ownerToken}) async{
    String _userToken = BlocProvider.of<SplashCubit>(ctx).androidId;
    await _roomOperationsWebServices.leaveRoom(token: _userToken, idRoom: idRoom,
      ownerToken: ownerToken);
  }

}