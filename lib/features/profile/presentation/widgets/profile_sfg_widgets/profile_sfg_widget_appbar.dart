
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../cubit/sfg_cubit.dart';

class ProfileSFGWidgetAppBar extends StatelessWidget {
  const ProfileSFGWidgetAppBar({Key? key, required this.capacity}) : super(key: key);
  final int capacity;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        leading: ElevatedButton(
          child: const Image(image: AssetImage(ImgAssets.arrowBack)),
          onPressed: () async{

            await BlocProvider.of<SfgCubit>(context)
                .leaveSearchForGame(capacity: capacity, ctx: context);
            Navigator.pop(context);

          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black.withOpacity(0),
            fixedSize: const Size(40, 40),
            shape: const CircleBorder(),
            elevation: 0,
          ),
        )
    );
  }
}
