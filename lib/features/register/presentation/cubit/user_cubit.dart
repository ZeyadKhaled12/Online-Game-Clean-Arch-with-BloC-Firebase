import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/user_repository.dart';




part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  final UserRepository userRepository;
  late String name;
  late int winCount;
  late String avatarImagePath;
  late List avatarPicsUrls = [];
  late int indexPic = -1;

  UserCubit(this.userRepository) : super(UserInitial());

  getUserData({required BuildContext ctx}) async{
    emit(UserInitial());
    final user = await userRepository.getDataUser(context: ctx);
    print('\n\n$user\n\n');
    name = user['name'];
    winCount = user['win_count'];
    avatarImagePath = user['avatar_path'];
    emit(UserGetData());
  }

  createUser({required String name, required String avatarPath
    , required BuildContext ctx}) async{
    emit(UserInitial());
    await userRepository.createNewUser(name: name, avatarPath: avatarPath,
      ctx: ctx);
    emit(UserCreate());
  }

  getAvatarPicsUrls() async{
    emit(UserInitial());
    avatarPicsUrls = await userRepository.getAvatarPics();
    emit(UserGetAvatarPics());
  }

  getIndex(int index){
    emit(UserInitial());
    indexPic = index;
    emit(UserGetAvatarPics());
  }


}
