

import 'package:flutter/material.dart';
import 'package:kaito/core/utils/assets_manager.dart';

import 'room_widget_gamer_owner.dart';
import 'room_widget_gamer_pic.dart';
import 'room_widget_gamer_title.dart';





class RoomWidgetGamer extends StatelessWidget {
  const RoomWidgetGamer({Key? key, required this.imageUrl,
    required this.gamerName, required this.winCount,
    required this.isOwner, required this.isOwnerOwner,
    required this.isOwnerRoom, required this.index}) : super(key: key);
  final String imageUrl;
  final String gamerName;
  final int winCount;
  final bool isOwner;
  final bool isOwnerOwner;
  final bool isOwnerRoom;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
      child: SizedBox(
        width: double.infinity,
        height: 86,
        child: Card(
          elevation: 15,
          color: Theme.of(context).secondaryHeaderColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: isOwner?
            BorderSide(color: Theme.of(context).textSelectionTheme.selectionColor!, width: 2):
            BorderSide(color: Colors.white.withOpacity(0))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                      child: RoomWidgetGamerPic(imageUrl: imageUrl),
                      padding: const EdgeInsets.only(left: 10)
                  ),
                  RoomWidgetGamerTitle(gamerName: gamerName, winCount: winCount)
                ],
              ),
              RoomWidgetGamerOwner(isOwnerRoom: isOwnerRoom, isOwnerOwner: isOwnerOwner,
                index: index)
            ],
          )
        ),
      ),
    );
  }
}
