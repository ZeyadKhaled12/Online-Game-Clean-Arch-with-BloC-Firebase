
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kaito/core/utils/assets_manager.dart';
import 'package:kaito/features/profile/presentation/widgets/profile_sfg_widgets/profile_sfg_dialog_widgets/profile_sfg_widget_dialog.dart';

import '../../../cj_room/presentation/widgets/cj_room_widget_dialog_template.dart';
import '../../../cj_room/presentation/widgets/cj_room_widget_init_dialog.dart';
import '../../../register/presentation/cubit/user_cubit.dart';
import 'profile_widget_button.dart';
import 'profile_widget_profile_pic.dart';



class ProfileWidgetBody extends StatelessWidget {
  const ProfileWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         BlocBuilder<UserCubit, UserState>(builder: (_, userState){
           return ProfileWidgetProfilePic(imageUrl: BlocProvider.of<UserCubit>(context).avatarImagePath,
               gamerName: BlocProvider.of<UserCubit>(context).name,
               winCount: BlocProvider.of<UserCubit>(context).winCount);
         }),
          const Padding(padding: EdgeInsets.only(bottom: 26)),

          ProfileWidgetButton(function: () async{
            showDialog(context: context, builder: (ctx){
              return const CJRoomWidgetDialogTemplate(
                content: ProfileSFGWidgetDialog(),
                title: 'Play with friends',
              );
            });
          }, title: 'Play', subTitle: 'now', imagePath: ImgAssets.playPath),

          const Padding(padding: EdgeInsets.only(bottom: 20)),
          ProfileWidgetButton(function: (){
            showDialog(context: context, builder: (ctx){
              return const CJRoomWidgetDialogTemplate(
                content: CJRoomWidgetInitDialog(),
                title: 'Play with friends',
              );
            });
          }, title: 'Private',
              subTitle: 'room', imagePath: ImgAssets.privatePath)
        ],
      ),
    );
  }
}
