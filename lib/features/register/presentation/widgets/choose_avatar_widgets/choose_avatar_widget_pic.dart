
import 'package:flutter/material.dart';


class ChooseAvatarWidgetPic extends StatelessWidget {
  const ChooseAvatarWidgetPic({Key? key, required this.imageUrl
    , required this.isChosen}) : super(key: key);
  final String imageUrl;
  final bool isChosen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              border: isChosen?Border.all(color: Colors.white, width: 8):null,
              borderRadius: BorderRadius.circular(15)),
          child: Image(fit: BoxFit.cover, image: NetworkImage(imageUrl))),
    );
  }
}
