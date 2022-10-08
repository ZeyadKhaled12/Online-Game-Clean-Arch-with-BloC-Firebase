import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../room/presentation/cubit/room_cubit.dart';
import '../../splash/presentation/cubit/splash_cubit.dart';

class ChatWebServices {
  Future sendMessage(
      {required BuildContext ctx, required String message}) async {
    await FirebaseFirestore.instance
        .collection('rooms')
        .doc(BlocProvider.of<RoomCubit>(ctx).id)
        .collection('chat')
        .doc()
        .set({
      'message': message,
      'token': BlocProvider.of<SplashCubit>(ctx).androidId,
      'date': _catchDate()
    });
  }

  DateTime _catchDate() {
    DateTime _date = DateTime.now();
    return _date;
  }

  Future clearChat({required BuildContext ctx}) async {
    await FirebaseFirestore.instance
        .collection('rooms')
        .doc(BlocProvider.of<RoomCubit>(ctx).id)
        .collection('chat')
        .get()
        .then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }
}
