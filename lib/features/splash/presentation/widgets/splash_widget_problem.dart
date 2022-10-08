
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashWidgetProblem extends StatelessWidget {
  const SplashWidgetProblem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Oops! there is a problem we work on it now', style: TextStyle(
            color: Colors.black,fontSize: 18,
            fontFamily: 'com'
        )),
        TextButton(onPressed: (){
          SystemNavigator.pop();
        }, child: Text('Ok', style: TextStyle(
            color: Theme.of(context).primaryColor, fontSize: 20,
            fontWeight: FontWeight.bold
        ))),
      ],
    );
  }
}
