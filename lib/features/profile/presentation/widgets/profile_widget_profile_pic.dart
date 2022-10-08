import 'package:flutter/material.dart';
import 'package:kaito/core/utils/app_colors.dart';
import 'package:kaito/core/utils/assets_manager.dart';

class ProfileWidgetProfilePic extends StatelessWidget {
  const ProfileWidgetProfilePic({Key? key, required this.imageUrl,required this.gamerName
    , required this.winCount}) : super(key: key);
  final String imageUrl;
  final String gamerName;
  final int winCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                height: 90,
                width: 90,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(36)),
                child: Image(fit: BoxFit.cover, image: NetworkImage(imageUrl))),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    child: const Image(
                        image: AssetImage(ImgAssets.winCountPath),
                        width: 25,
                        height: 25),
                    radius: 15,
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                  ),
                  Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.button),
                      child: Center(
                        child: Text('$winCount',
                            style: TextStyle(color:
                            Theme.of(context).textSelectionTheme.selectionColor)),
                      ))
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Text(gamerName,
              style: TextStyle(
                  color: Theme.of(context).textSelectionTheme.selectionColor,
                  fontFamily: 'com', fontSize: 20)),
        )
      ],
    );
  }
}
