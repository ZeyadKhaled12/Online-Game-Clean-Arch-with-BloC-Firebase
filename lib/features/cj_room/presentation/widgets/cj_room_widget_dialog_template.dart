
import 'package:flutter/material.dart';
import 'package:kaito/core/utils/app_colors.dart';



class CJRoomWidgetDialogTemplate extends StatelessWidget {
  const CJRoomWidgetDialogTemplate({Key? key,
    required this.title, required this.content}) : super(key: key);
  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: const TextStyle(
        color: AppColors.button
      ), textAlign: TextAlign.center),
      content: content,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35)
      ),
      backgroundColor: Theme.of(context).dialogTheme
          .backgroundColor?.withOpacity(1),
    );
  }
}
