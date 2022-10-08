// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaito/core/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent_plus/android_intent.dart';


class SplashWidgetUpdate extends StatelessWidget {
  const SplashWidgetUpdate({Key? key, required this.url}) : super(key: key);
  final String url;

  goToLink() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else if (Platform.isAndroid) {
      const AndroidIntent intent = AndroidIntent(
          action: 'action_view',
          data: 'play.google.com'
      );
      await intent.launch();
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('There is a new version, do you want update it now',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontFamily: 'com')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () async => await goToLink(),
                child: const Text('Yes',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
            const Padding(padding: EdgeInsets.only(right: 40)),
            TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text('No',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)))
          ],
        )
      ],
    );
  }
}
