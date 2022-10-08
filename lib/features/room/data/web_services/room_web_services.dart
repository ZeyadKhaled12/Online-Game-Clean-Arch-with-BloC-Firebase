
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/features/splash/presentation/cubit/splash_cubit.dart';

import '../../../register/data/web_services/user_web_services.dart';


class RoomWebServices {

  Future createRoom({required Map<String, dynamic> map}) async {
    try {
      await FirebaseFirestore.instance.collection('rooms').doc(map['id']).set(map);
      return map;}
    catch (e) {print(e);}
  }

  Future joinRoom({required String id, required String userToken}) async {
    try {
      bool _isExist = await FirebaseFirestore.instance.collection('rooms')
          .doc(id).get().then((value) => value.exists);

      if (_isExist) {
        bool _isFullRoom = await FirebaseFirestore.instance.collection('rooms').doc(id)
            .get().then((value) => value['gamers_tokens'].length == value['capacity_room']);
        if (!_isFullRoom) {
          final data = await FirebaseFirestore.instance
              .collection('rooms').doc(id).get().then((DocumentSnapshot doc) {
            final data = doc.data() as Map<String, dynamic>;
            return data;
          });
          data['gamers_tokens'].add(userToken);
          await FirebaseFirestore.instance
              .collection('rooms').doc(id).update({'gamers_tokens': data['gamers_tokens']});
          return data;
        }else{
          return {'error': 'This room is full'};
        }
      } else {
        return {'error': 'This code does not exist'};
      }
    } catch (e) {
      print('\n\n${e.toString()}\n\n');
    }
  }

  Future<List<Map<String, dynamic>>> getGamersInRoom({
    required List listOfTokens}) async {
    UserWebServices _userWebServices = UserWebServices();
    List<Map<String, dynamic>> _list = [];
    for (String i in listOfTokens) {
      Map<String, dynamic>_map = await _userWebServices.getDataUser(androidId: i);
      _list.add(_map);
    }
    return _list;
  }

  Future updateGameStart({required String idRoom}) async{
    await FirebaseFirestore.instance.collection('rooms')
        .doc(idRoom).update({
      'is_game_start': false
    });
  }


}
