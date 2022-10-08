
import 'package:flutter/material.dart';
import 'package:kaito/config/routes/app_routes.dart';
import 'package:kaito/config/themes/app_theme.dart';
import 'package:kaito/core/utils/app_strings.dart';



class Kaito extends StatelessWidget {
  const Kaito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
