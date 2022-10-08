
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class CJRoomWidgetDialogCreateTxtField extends StatelessWidget {
  const CJRoomWidgetDialogCreateTxtField({Key? key,
    required this.hintText, required this.controller,
    required this.isError, required this.message,
    this.regExp = "[a-zA-Z0-9]", required this.length,
    this.isDigitsOnly = false}) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final bool isError;
  final String message;
  final String regExp;
  final int length;
  final bool isDigitsOnly;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).textSelectionTheme.selectionColor
          ),
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: isDigitsOnly?TextInputType.number:null,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(regExp)),
              LengthLimitingTextInputFormatter(length),
              if(isDigitsOnly) FilteringTextInputFormatter.digitsOnly
            ],
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                    color: Colors.grey, fontSize: 20)
            ),
            cursorColor: Colors.black,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if(isError)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(message,
                style: const TextStyle(color: Colors.red, fontSize: 16)),
          )
      ],
    );
  }
}

