part of 'room_cubit.dart';

@immutable
abstract class RoomState {}

class RoomInitial extends RoomState {}

class RoomCreate extends RoomState{}

class RoomJoin extends RoomState{}

class RoomDataGamersInRoom extends RoomState{}

class RoomUpdateDataInRoom extends RoomState{}

class RoomStartGame extends RoomState{}

class RoomKikGamer extends RoomState{}
