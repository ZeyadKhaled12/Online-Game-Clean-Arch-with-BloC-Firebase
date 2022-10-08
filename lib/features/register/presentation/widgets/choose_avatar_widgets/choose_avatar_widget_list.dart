
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/core/utils/app_colors.dart';
import 'package:kaito/core/utils/constants.dart';

import '../../cubit/user_cubit.dart';
import 'choose_avatar_widget_pic.dart';



class ChooseAvatarWidgetList extends StatelessWidget {

  const ChooseAvatarWidgetList({Key? key, required this.docs}) : super(key: key);
  final List docs;


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 25,left: 25, right: 25),
      child: Container(
        height: Constants().height(context) * 1/2,
        padding: const EdgeInsets.all(20),
        color: AppColors.button,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (_, index) => InkWell(
              onTap: ()async{
                await Constants().audioOnClickButton();
                BlocProvider.of<UserCubit>(context).getIndex(index);
              },
              child: ChooseAvatarWidgetPic(imageUrl: docs[index],
                isChosen: BlocProvider.of<UserCubit>(context).indexPic == index)),
          itemCount: docs.length,
        ),
      ),
    );
  }
}
