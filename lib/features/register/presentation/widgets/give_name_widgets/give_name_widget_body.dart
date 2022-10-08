
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/config/routes/routes_names.dart';
import 'package:kaito/features/register/presentation/screens/choose_avatar_screen.dart';

import '../../../../../core/utils/constants.dart';

import '../../cubit/user_cubit.dart';
import 'give_name_widget_button.dart';
import 'give_name_widget_txt_field.dart';




class GiveNameWidgetBody extends StatefulWidget {
  const GiveNameWidgetBody({Key? key}) : super(key: key);

  @override
  State<GiveNameWidgetBody> createState() => _GiveNameWidgetBodyState();
}

class _GiveNameWidgetBodyState extends State<GiveNameWidgetBody> {

  bool _isError = false;

  @override
  Widget build(BuildContext context) {

    TextEditingController _controller = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GiveNameWidgetTxtField(controller: _controller,
          isError: _isError),
        const Padding(padding: EdgeInsets.only(top: 90)),
        BlocBuilder<UserCubit, UserState>(
          builder: (_, userState){
            return GiveNameWidgetButton(function: () async{
              await Constants().audioOnClickButton();
              if(_controller.text.contains(RegExp("[a-zA-Z]"))){
                await Navigator.push(
                  context, MaterialPageRoute(builder: (context)
                  => ChooseAvatarScreen(name: _controller.text)),
                );
              }
              setState(() {_isError = true;});
            });
          },
        )
      ],
    );
  }
}
