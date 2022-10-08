import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/assets_manager.dart';

class RoomWidgetGamerTitle extends StatelessWidget {
  const RoomWidgetGamerTitle(
      {Key? key, required this.gamerName, required this.winCount})
      : super(key: key);
  final String gamerName;
  final int winCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(gamerName,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'com',
                  color: Theme.of(context).primaryColor)),
          Row(
            children: [
              const CircleAvatar(
                  child: Image(
                      image: AssetImage(ImgAssets.winCountPath),
                      width: 25,
                      height: 25),
                  radius: 15,
                  backgroundColor: AppColors.button),
              Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.button),
                  child: Center(
                    child: Text('$winCount',
                        style: TextStyle(
                            color: Theme.of(context).textSelectionTheme.selectionColor)),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
