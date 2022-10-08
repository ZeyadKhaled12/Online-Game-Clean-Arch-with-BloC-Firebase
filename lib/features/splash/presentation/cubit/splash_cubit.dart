
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


import '../../data/repositories/splash_repository.dart';

part 'splash_state.dart';


class SplashCubit extends Cubit<SplashState> {

  final SplashRepository splashRepository;
  late String androidId;
  late bool isExist;
  //[update, problem, link]
  List updates = [false, false, ''];

  SplashCubit(this.splashRepository) : super(SplashInitial());

  whenSplashOpen(BuildContext ctx) async{
    emit(SplashInitial());
    await checkUpdate();
    if(updates[0] == false && updates[1] == false) {
      await getAndroidId(ctx);
      await ifAndroidIdExist(ctx);
      await navigateFun(ctx: ctx);
    }else{
      print('\n\nWillNotOpen $updates\n');
    }
    emit(SplashWhenAppOpen());
  }

  getAndroidId(BuildContext ctx) async{
    emit(SplashInitial());
    androidId = await splashRepository.getAndroidIdFun(ctx);
    emit(SplashAndroidId());
  }

  checkUpdate() async{
    emit(SplashInitial());
    updates = await splashRepository.checkUpdate();
    emit(SplashCheckUpdate());
  }

  ifAndroidIdExist(BuildContext ctx) async{
    emit(SplashInitial());
    isExist = await splashRepository
        .ifAndroidIdExist(androidId: androidId, ctx: ctx);
    emit(SplashCheckIfAndroidExist());
  }

  navigateFun({required BuildContext ctx}) async{
    emit(SplashInitial());
    await splashRepository.navigateFun(ctx: ctx, isExist: isExist);
    emit(SplashAndroidId());
  }

}
