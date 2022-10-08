
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

import '../widgets/chat_widget_list.dart';
import '../widgets/chat_widget_text_field.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.button.withOpacity(0.6),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: const [
          ChatWidgetList(),
          ChatWidgetTextField()
        ],
      ),
    );
  }
}
