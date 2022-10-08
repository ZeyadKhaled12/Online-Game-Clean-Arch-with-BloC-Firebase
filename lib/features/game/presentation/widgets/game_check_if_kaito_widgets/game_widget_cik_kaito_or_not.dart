
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_manager.dart';

class GameWidgetCikKaitoOrNot extends StatelessWidget {
  const GameWidgetCikKaitoOrNot({Key? key, required this.isKaito
    , required this.name
    , required this.imageUrl}) : super(key: key);
  final bool isKaito;
  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Image(image: NetworkImage(imageUrl), height: 90),
        ),
        Text('$name Kicked out',
            style: TextStyle(
                color: Theme.of(context).textSelectionTheme.selectionColor,
                fontFamily: 'com',
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        isKaito
            ? Column(
                children: const [
                  Padding(padding: EdgeInsets.only(bottom: 15)),
                  Image(image: AssetImage(ImgAssets.logoPath), height: 50),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text('He is kaito',
                      style: TextStyle(
                          color: AppColors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold))
                ],
              )
            : const Padding(
                child: Text('Not kaito',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                padding: EdgeInsets.only(top: 40),
              )
      ],
    );
  }
}
