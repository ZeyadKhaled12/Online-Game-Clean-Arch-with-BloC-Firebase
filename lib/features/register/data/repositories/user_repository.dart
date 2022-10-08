
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/features/splash/presentation/cubit/splash_cubit.dart';

import '../models/user_model.dart';
import '../web_services/user_web_services.dart';


class UserRepository{

  final UserWebServices userWebServices;

  UserRepository(this.userWebServices);

  Future getDataUser({required BuildContext context}) async{
    final Map<String, dynamic> user = await userWebServices.getDataUser(
      androidId: BlocProvider.of<SplashCubit>(context).androidId);
    UserModel userModel = UserModel.fromJson(user);
    return userModel.toJson();
  }


  Future createNewUser({required String name, required String avatarPath
    , required BuildContext ctx}) async{
    UserModel _userModel = UserModel(avatarImagePath: avatarPath, winCount: 0, name: name);
    await userWebServices.createUser(
        map: _userModel.toJson(),
        androidId: BlocProvider.of<SplashCubit>(ctx).androidId);
  }


  Future<List> getAvatarPics() async{
    return await userWebServices.getAvatarPics();
  }


}