
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/config/routes/routes_names.dart';
import 'package:kaito/core/utils/assets_manager.dart';

import 'package:kaito/features/room/presentation/cubit/room_cubit.dart';

import '../../../../core/utils/general_widgets/alert_dialog_widget.dart';



class RoomWidgetArrowBack extends StatelessWidget {
  const RoomWidgetArrowBack({Key? key
    , required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Image(image: AssetImage(ImgAssets.arrowBack)),
      onPressed: () {
        showDialog(context: context, builder: (ctx){
          return AlertDialogWidget(
            title: title,
            yesFun: () async{
              await BlocProvider.of<RoomCubit>(context).leaveRoom(ctx: context);
              Navigator.pop(context);
              await Navigator.pushReplacementNamed(context, RoutesNames.profileScreen);
            },
            noFun: (){Navigator.pop(context);},
          );
        },barrierDismissible: false);
        //Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.black.withOpacity(0),
        fixedSize: const Size(40, 40),
        shape: const CircleBorder(),
        elevation: 0,
      ),
    );
  }
}
