
import 'package:flutter/material.dart';
import 'package:kaito/core/utils/app_colors.dart';




class GiveNameWidgetButton extends StatelessWidget {
  const GiveNameWidgetButton({Key? key, required this.function}) : super(key: key);
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(Icons.arrow_forward_ios,
        color: Theme.of(context).textSelectionTheme.selectionColor,
        size: 35),
      onPressed: function,
      style: ElevatedButton.styleFrom(
        primary: AppColors.button,
        fixedSize: const Size(80, 80),
        shape: const CircleBorder(),
        elevation: 10,
      ),
    );
  }
}
