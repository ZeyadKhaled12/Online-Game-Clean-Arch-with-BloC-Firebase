
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/core/utils/app_colors.dart';

import '../cubit/chat_cubit.dart';

class ChatWidgetTextField extends StatefulWidget {
  const ChatWidgetTextField({Key? key}) : super(key: key);

  @override
  State<ChatWidgetTextField> createState() => _ChatWidgetTextFieldState();
}

class _ChatWidgetTextFieldState extends State<ChatWidgetTextField> {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.white.withOpacity(0.8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                controller: controller,
                onChanged: (val){
                  if(val.startsWith(' ') && val.length == 1){
                    setState(() {controller.clear();});
                  }
                },
                maxLength: 40,
                cursorColor: Colors.black,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                    hintText: 'Send message',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20)),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                BlocProvider.of<ChatCubit>(context).sendMessage(ctx: context, message: controller.text);
                controller.clear();
              },
              icon: const Icon(
                Icons.send,
                color: AppColors.green,
                size: 28,
              ))
        ],
      ),
    );
  }
}
