
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../splash/presentation/cubit/splash_cubit.dart';
import '../../data/repositories/room_repository.dart';


part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {

  final RoomRepository roomRepository;
  late String name;
  late String id;
  late int capacityRoom;
  late String ownerToken;
  late List gamersTokens;
  late bool isGameStart;
  late List<Map<String, dynamic>> dataGamersInRoom;
  late int limitRounds;
  late bool isSearchGame;

  RoomCubit(this.roomRepository) : super(RoomInitial());

  Future createRoom({required String name
    , required int capacityRoom
    , required int limitRounds
    , bool isSearchGame =  false
    , String token = ''
    , required BuildContext ctx}) async{
    emit(RoomInitial());
    this.isSearchGame = isSearchGame;
    Map _map = await roomRepository.createRoom(name: name,
        token: token,
        limitRounds: limitRounds,
        capacityRoom: capacityRoom, ctx: ctx);
    this.name = _map['name'];
    id = _map['id'];
    this.limitRounds = limitRounds;
    this.capacityRoom = capacityRoom;
    ownerToken = BlocProvider.of<SplashCubit>(ctx).androidId;
    gamersTokens = [];
    dataGamersInRoom = [];
    isGameStart = false;
    emit(RoomCreate());
  }

  joinRoom({required BuildContext ctx, required String id
    , bool isSearchGame = false}) async{
    emit(RoomInitial());
    this.isSearchGame = isSearchGame;
    Map _map = await roomRepository.joinRoom(id: id, ctx: ctx);
    if(!_map.containsKey('error')) {
      name = _map['name'];
      this.id = _map['id'];
      capacityRoom = _map['capacity_room'];
      ownerToken = _map['owner_token'];
      gamersTokens = _map['gamers_tokens'];
      isGameStart = _map['is_game_start'];
      limitRounds = _map['limit_rounds'];
      await getDataGamersInRoom(ctx: ctx);
      return {};
    }else{
      return _map;
    }
  }

  updateGamersInRoom({required List tokens, required BuildContext ctx}) async{
    emit(RoomInitial());
    gamersTokens = tokens;
    await getDataGamersInRoom(ctx: ctx);
    emit(RoomUpdateDataInRoom());
  }

  updateOwnerToken({required String ownerToken}) async{
    emit(RoomInitial());
    this.ownerToken = ownerToken;
    emit(RoomUpdateDataInRoom());
  }

  updateGameStart() async{
    emit(RoomInitial());
    await roomRepository.updateGameStart(idRoom: id);
    emit(RoomUpdateDataInRoom());
  }



  getDataGamersInRoom({required BuildContext ctx}) async{
    emit(RoomInitial());
    List<Map<String, dynamic>> _list = await roomRepository
        .getDataGamersInRoom(ctx: ctx);
    dataGamersInRoom = _list;
    emit(RoomJoin());
  }

  startGameInRoom() async{
    emit(RoomInitial());
    await roomRepository.startGame(roomId: id);
    emit(RoomStartGame());
  }

  kickGamer({required int index}) async{
    emit(RoomInitial());
    await roomRepository.kikGamer(id: id, index: index,
      ownerToken: ownerToken);
    emit(RoomStartGame());
  }

  leaveRoom({required BuildContext ctx}) async{
    emit(RoomInitial());
    await roomRepository.leaveRoom(ctx: ctx, idRoom: id,
        ownerToken: ownerToken);
    emit(RoomStartGame());
  }

}
