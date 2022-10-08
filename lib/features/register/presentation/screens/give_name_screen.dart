
import 'package:flutter/material.dart';
import 'package:kaito/core/utils/constants.dart';
import 'package:kaito/features/register/presentation/widgets/give_name_widgets/give_name_widget_body.dart';
import 'package:kaito/features/register/presentation/widgets/give_name_widgets/give_name_widget_txt_field.dart';
import 'package:kaito/features/register/presentation/widgets/register_widget_template.dart';




class GiveNameScreen extends StatefulWidget {
  const GiveNameScreen({Key? key}) : super(key: key);

  @override
  _GiveNameScreenState createState() => _GiveNameScreenState();
}

class _GiveNameScreenState extends State<GiveNameScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Constants().showStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    return const RegisterWidgetTemplate(widgetBody: GiveNameWidgetBody());
  }
}
