
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../config/routes/routes_names.dart';
import '../web_services/splash_web_services.dart';

class SplashRepository {
  SplashWebServices splashWebServices;

  SplashRepository(this.splashWebServices);

  Future<String> getAndroidIdFun(BuildContext ctx) async {
    final String androidId = await splashWebServices.getAndroidIdFun(ctx: ctx);
    return androidId;
  }

  Future checkUpdate() async{
    await _getVersion();
    List list = await splashWebServices.checkUpdate(
      version: await _getVersion());
    return list;
  }

  Future<String> _getVersion() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
   return packageInfo.buildNumber;
  }

  Future<bool> ifAndroidIdExist({required String androidId
    , required BuildContext ctx}) async{
    return await splashWebServices.ifAndroidIdExist(androidId: androidId, ctx: ctx);
  }

  Future navigateFun({required bool isExist, required BuildContext ctx}) async {
    await Future.delayed(const Duration(milliseconds: 3400), () async {
      if (!isExist) {
        Navigator.pushReplacementNamed(ctx, RoutesNames.giveNameScreen);
      } else {
        Navigator.pushReplacementNamed(ctx, RoutesNames.profileScreen);
      }
    });
  }
}
