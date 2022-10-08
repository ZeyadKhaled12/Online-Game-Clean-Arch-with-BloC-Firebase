
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../splash/presentation/widgets/splash_widget_logo.dart';



class RegisterWidgetTemplate extends StatelessWidget {
  const RegisterWidgetTemplate({Key? key,
  required this.widgetBody}) : super(key: key);
  final Widget widgetBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          child:  Padding(
            padding: EdgeInsets.only(top: 30),
              child: SplashWidgetLogo()),
          preferredSize: Size.fromHeight(100),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widgetBody
                ],
              ),
            ),
          ),
        )
    );
  }
}
