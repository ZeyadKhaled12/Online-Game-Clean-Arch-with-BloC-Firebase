

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../room/presentation/cubit/room_cubit.dart';
import '../../../splash/presentation/cubit/splash_cubit.dart';
import 'chat_widget_message.dart';

class ChatWidgetList extends StatelessWidget {
  const ChatWidgetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 26, bottom: 52),
        child: StreamBuilder<QuerySnapshot>(

          stream: FirebaseFirestore.instance.collection('rooms')
              .doc(BlocProvider.of<RoomCubit>(context).id).collection('chat')
              .orderBy('date', descending: true).snapshots(),

          builder: (ctx, snapShot){
            if(snapShot.connectionState != ConnectionState.waiting){
              final docs = snapShot.data!.docs;
              return ListView.builder(itemBuilder: (ctx, index){
                return ChatWidgetMessage(
                    isCurrentUser: docs[index]['token'] ==
                        BlocProvider.of<SplashCubit>(context).androidId,

                    imageUrl: BlocProvider.of<RoomCubit>(context)
                        .dataGamersInRoom[BlocProvider.of<RoomCubit>(context)
                        .gamersTokens.indexOf(docs[index]['token'])]['avatar_path'],

                    message: docs[index]['message']
                );
              }, itemCount: docs.length, reverse: true);
            }
            return ListView.builder(itemBuilder: (ctx, index){
              return const ChatWidgetMessage(isCurrentUser:false, imageUrl: '', message: '');
            }, itemCount: 0, reverse: true);
          },
        )
    );
  }
}
