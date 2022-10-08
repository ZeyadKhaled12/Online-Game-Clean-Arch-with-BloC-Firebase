
import 'package:flutter/material.dart';
import 'package:kaito/core/utils/app_colors.dart';

class ChatWidgetMessage extends StatelessWidget {

  const ChatWidgetMessage({Key? key, required this.isCurrentUser,
    required this.message, required this.imageUrl}) : super(key: key);
  final bool isCurrentUser;
  final String message;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    Radius _circular = const Radius.circular(16);
    return Container(

      padding: isCurrentUser?const EdgeInsets.only(left: 10, bottom: 12) :
      const EdgeInsets.only(right: 10, bottom: 12),

      child: Column(
        crossAxisAlignment: isCurrentUser? CrossAxisAlignment.start:
        CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 40),
            child: Container(
              //width: Constants().width(context) * 1/1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: _circular,
                  topRight: _circular,
                  bottomRight: isCurrentUser?_circular: const Radius.circular(0),
                  bottomLeft: isCurrentUser? const Radius.circular(0): _circular,
                ),
                color: isCurrentUser? AppColors.green:
                Colors.white.withOpacity(0.6)
              ),
              padding: const EdgeInsets.all(15),
              child: Text(message, style: TextStyle(
                color: isCurrentUser?
                Colors.white: Colors.black, fontSize: 18,
                fontWeight: FontWeight.bold)),
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 10)),
          CircleAvatar(backgroundImage: NetworkImage(imageUrl), radius: 21),
        ],
      ),
    );
  }
}
