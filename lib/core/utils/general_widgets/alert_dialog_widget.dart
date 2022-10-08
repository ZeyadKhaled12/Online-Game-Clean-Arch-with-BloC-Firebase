

import 'package:flutter/material.dart';


class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key, required this.yesFun,
    required this.noFun, required this.title}) : super(key: key);
  final String title;
  final Function() yesFun;
  final Function() noFun;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: TextStyle(
              color: Theme.of(context).primaryColor, fontSize: 20,
              fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: yesFun,
                    child: const Text('Yes', style: TextStyle(color: Colors.black, fontSize: 20
                ))),
                TextButton(onPressed: noFun, child: const Text('No', style: TextStyle(
                    color: Colors.black, fontSize: 20
                )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
