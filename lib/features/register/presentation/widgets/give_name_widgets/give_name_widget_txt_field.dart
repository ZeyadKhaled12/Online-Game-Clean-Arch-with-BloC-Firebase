import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class GiveNameWidgetTxtField extends StatelessWidget {
  const GiveNameWidgetTxtField({Key? key, required this.controller,
    required this.isError}) : super(key: key);
  final TextEditingController controller;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Name', style: TextStyle(
            color: Theme.of(context).textSelectionTheme.selectionColor, 
            fontSize: 28, fontFamily: 'com')),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 10),
          child: Container(height: 60, decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).secondaryHeaderColor,
            ),
            child: TextField(controller: controller,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]"))],
              textAlign: TextAlign.center, decoration: const InputDecoration(
                border: InputBorder.none),
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(color: Theme.of(context).primaryColor,
                fontSize: 25, fontFamily: 'com', fontWeight: FontWeight.bold),
            ),
          ),
        ),
        if(isError)
          const Text('This field is required',
              style: TextStyle(color: Color(0XFF86B21D), fontSize: 18))
      ],
    );
  }
}
