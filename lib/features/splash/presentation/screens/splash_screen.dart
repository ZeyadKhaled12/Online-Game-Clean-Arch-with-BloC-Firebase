import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kaito/core/utils/constants.dart';
import 'package:kaito/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:kaito/features/splash/presentation/widgets/splash_widget_problem.dart';
import 'package:kaito/features/splash/presentation/widgets/splash_widget_update.dart';

import '../../../../core/utils/general_widgets/animation_widget_opacity.dart';
import '../../../cj_room/presentation/widgets/cj_room_widget_dialog_template.dart';
import '../../../cj_room/presentation/widgets/cj_room_widget_init_dialog.dart';
import '../../data/repositories/splash_repository.dart';
import '../widgets/splash_widget_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Constants().hideStatusBar();
    BlocProvider.of<SplashCubit>(context).whenSplashOpen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(child: BlocBuilder<SplashCubit, SplashState>(
        builder: (ctx, _) {
          return Stack(
            alignment: Alignment.center,
            children: [
              AnimationWidgetOpacity(
                seconds: 2,
                widgetOpacity: const SplashWidgetLogo(),
              ),
              if (BlocProvider.of<SplashCubit>(context).updates[0] ||
                  BlocProvider.of<SplashCubit>(context).updates[1])
                Container(
                    color: Colors.black.withOpacity(0.5),
                    width: double.infinity,
                    height: double.infinity),
              if (BlocProvider.of<SplashCubit>(context).updates[0] ||
                  BlocProvider.of<SplashCubit>(context).updates[1])
                CJRoomWidgetDialogTemplate(
                    content: BlocProvider.of<SplashCubit>(context).updates[0]
                        ? SplashWidgetUpdate(
                      url: BlocProvider.of<SplashCubit>(context).updates[2])
                        : const SplashWidgetProblem(),
                    title: 'Alert')
            ],
          );
        },
      )),
    );
  }
}
