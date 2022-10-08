
import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../register/presentation/widgets/register_widget_template.dart';
import '../widgets/profile_widget_body.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    Constants().showStatusBar();
    //FirebaseAuth.instance.signOut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const RegisterWidgetTemplate(widgetBody: ProfileWidgetBody());
  }
}
