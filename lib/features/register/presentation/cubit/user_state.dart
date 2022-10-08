part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserGetData extends UserState{}

class UserCreate extends UserState{}

class UserGetAvatarPics extends UserState{}
