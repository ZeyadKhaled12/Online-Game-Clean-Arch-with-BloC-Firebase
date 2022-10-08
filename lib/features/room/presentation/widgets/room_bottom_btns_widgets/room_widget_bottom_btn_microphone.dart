
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../chat/presentation/screens/chat_screen.dart';


class RoomWidgetBottomBtnMicroPhone extends StatefulWidget {
  const RoomWidgetBottomBtnMicroPhone({Key? key}) : super(key: key);


  @override
  State<RoomWidgetBottomBtnMicroPhone> createState() => _RoomWidgetBottomBtnMicroPhoneState();
}

class _RoomWidgetBottomBtnMicroPhoneState extends State<RoomWidgetBottomBtnMicroPhone> {


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(Icons.chat, color: Theme.of(context)
          .textSelectionTheme.selectionColor, size: 24),
      onPressed: () async{
        showModalBottomSheet(
            backgroundColor: Colors.white.withOpacity(0),
            isScrollControlled: true,
            enableDrag: true,
            context: context,
            builder: (BuildContext ctx) {
              return const ChatScreen();
            });
      },
      style: ElevatedButton.styleFrom(
        primary: AppColors.button,
        fixedSize: const Size(69, 69),
        shape: const CircleBorder(),
        elevation: 8,
      ),
    );
  }
}
