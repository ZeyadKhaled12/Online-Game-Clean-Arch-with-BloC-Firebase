



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/core/utils/constants.dart';

import '../../../../../config/routes/routes_names.dart';
import '../../cubit/user_cubit.dart';
import '../give_name_widgets/give_name_widget_button.dart';
import 'choose_avatar_widget_list.dart';


class ChooseAvatarWidgetBody extends StatelessWidget {

  const ChooseAvatarWidgetBody({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Choose avatar', style: TextStyle(
          color: Theme.of(context).textSelectionTheme.selectionColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'com',
          fontSize: 22
        )),
        const Padding(padding: EdgeInsets.only(bottom: 15)),
        BlocBuilder<UserCubit, UserState>(builder: (_, ctx){
          return ChooseAvatarWidgetList(docs: BlocProvider.of<UserCubit>(context).avatarPicsUrls);
        }),
        GiveNameWidgetButton(function: () async{
          await Constants().audioOnClickButton();
          if(BlocProvider.of<UserCubit>(context).indexPic != -1) {
            await BlocProvider.of<UserCubit>(context)
                .createUser(name: name, avatarPath: BlocProvider.of<UserCubit>(context)
                .avatarPicsUrls[BlocProvider.of<UserCubit>(context).indexPic]
                , ctx: context);
            await BlocProvider.of<UserCubit>(context).getUserData(
                ctx: context);
            Navigator.pushReplacementNamed(context, RoutesNames.profileScreen);
          }else{
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Choose avatar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'com')),
                backgroundColor: Colors.black));
          }
        })
      ],
    );
  }
}
