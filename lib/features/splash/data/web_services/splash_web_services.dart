
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../register/presentation/cubit/user_cubit.dart';




class SplashWebServices{

  Future<List> checkUpdate({required String version}) async{
    List list  = await FirebaseFirestore.instance.collection('updates')
        .doc('updateproblemalerts').get().then((value) =>
    [
      value['version'] != version,
      value['problem'],
      value['link']
    ]);
    return list;
  }

  Future<String> getAndroidIdFun({required BuildContext ctx}) async{
    try {
      print('\n\nGet in\n\n');
      DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
      final _deviceInfo = await _deviceInfoPlugin.deviceInfo;
      final _map = _deviceInfo.toMap();
      final String _androidId =  _map['androidId'];
      return _androidId;
    }catch(error){print(error);}
    return'';
  }

  Future<bool> ifAndroidIdExist({required String androidId
    , required BuildContext ctx}) async{
    if(await FirebaseFirestore.instance.collection('users')
        .doc(androidId).get().then((value) => value.exists)){
      //await FirebaseAuth.instance.signInAnonymously();
      await BlocProvider.of<UserCubit>(ctx).getUserData(
          ctx: ctx);
      return true;
    }
    return false;
  }

}