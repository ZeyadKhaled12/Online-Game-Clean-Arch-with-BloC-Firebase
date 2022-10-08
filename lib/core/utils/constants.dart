

import 'package:soundpool/soundpool.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'assets_manager.dart';

class Constants{
  double width(BuildContext ctx){
    return MediaQuery.of(ctx).size.width;
  }
  double height(BuildContext ctx){
    return MediaQuery.of(ctx).size.height;
  }

  hideStatusBar(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []);
  }

  showStatusBar(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  Future audioOnClickButton() async{

    Soundpool pool = Soundpool(streamType: StreamType.notification);
    int soundId = await rootBundle.load(AudioAssets.onClickSound)
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    await pool.play(soundId);
  }

}
