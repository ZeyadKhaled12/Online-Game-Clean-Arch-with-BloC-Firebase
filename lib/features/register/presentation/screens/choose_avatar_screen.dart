
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/features/register/presentation/cubit/user_cubit.dart';

import '../widgets/choose_avatar_widgets/choose_avatar_widget_body.dart';
import '../widgets/register_widget_template.dart';


class ChooseAvatarScreen extends StatefulWidget {
  const ChooseAvatarScreen({Key? key, required this.name}) : super(key: key);
  final String name;


  @override
  _ChooseAvatarScreenState createState() => _ChooseAvatarScreenState();
}

class _ChooseAvatarScreenState extends State<ChooseAvatarScreen> {


  @override
  void initState() {

    Firebase.initializeApp().whenComplete(() {
      BlocProvider.of<UserCubit>(context).getAvatarPicsUrls();
    });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return RegisterWidgetTemplate(widgetBody: ChooseAvatarWidgetBody(name: widget.name));
  }
}
