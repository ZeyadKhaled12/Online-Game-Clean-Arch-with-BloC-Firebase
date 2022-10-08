
import 'package:flutter/material.dart';



class RoomWidgetGamerPic extends StatelessWidget {
  const RoomWidgetGamerPic({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 65,
        width: 65,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Theme.of(context).textSelectionTheme.selectionColor?.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Image(fit: BoxFit.cover, image: NetworkImage(imageUrl)));
  }
}
