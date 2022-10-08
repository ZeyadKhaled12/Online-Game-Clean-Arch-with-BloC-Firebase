
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/core/utils/app_colors.dart';
import 'package:kaito/features/room/presentation/cubit/room_cubit.dart';


class RoomWidgetGamerOwner extends StatelessWidget {
  const RoomWidgetGamerOwner({Key? key, required this.isOwnerOwner,
    required this.isOwnerRoom, required this.index}) : super(key: key);
  final bool isOwnerRoom;
  final bool isOwnerOwner;
  final int index;

  @override
  Widget build(BuildContext context) {
    return isOwnerRoom?
    Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Text('Owner', style: TextStyle(
          color: Theme.of(context).textSelectionTheme.selectionColor,
          fontSize: 16
      )),
    ): isOwnerOwner?
        BlocBuilder<RoomCubit, RoomState>
          (builder: (_, roomState){
            return  IconButton(onPressed: () async{
              await BlocProvider.of<RoomCubit>(context).kickGamer(index: index);},
                icon: const CircleAvatar(
                backgroundColor: AppColors.button,
                child: Icon(Icons.clear, color: Colors.white)));
        }):
    const Text('');
  }
}
