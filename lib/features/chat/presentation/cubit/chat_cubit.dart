
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/chat_web_services.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {

  final ChatWebServices chatWebServices;

  ChatCubit(this.chatWebServices) : super(ChatInitial());

  sendMessage({required BuildContext ctx, required String message}) async{
    await chatWebServices.sendMessage(ctx: ctx, message: message);
  }

  clearChat({required BuildContext ctx}) async{
    await chatWebServices.clearChat(ctx: ctx);
  }
}
