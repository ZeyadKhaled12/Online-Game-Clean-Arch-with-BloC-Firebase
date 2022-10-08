

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/room_cubit.dart';



class RoomWidgetCapacity extends StatelessWidget {
  const RoomWidgetCapacity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomCubit, RoomState>(builder: (_, roomState){
      return Center(
        child: Text('${
        BlocProvider.of<RoomCubit>(context).gamersTokens.length}/${
            BlocProvider.of<RoomCubit>(context).capacityRoom}', style:TextStyle(
            color: Theme.of(context).textSelectionTheme.selectionColor,
            fontWeight: FontWeight.bold, fontFamily: 'com'
        )),
      );
    });
  }
}
