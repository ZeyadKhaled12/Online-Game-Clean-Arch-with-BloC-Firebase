
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/sfg_web_services.dart';

part 'sfg_state.dart';


class SfgCubit extends Cubit<SfgState> {

  final SFGWebServices sfgWebServices;
  late bool isInSearch;
  SfgCubit(this.sfgWebServices) : super(SfgInitial());

  Future searchForGame({required BuildContext ctx
    , required int  capacity}) async{
    emit(SfgInitial());
    isInSearch = true;
    await sfgWebServices.searchForGame(capacity: capacity, ctx: ctx);
    emit(SfgSearch());
  }

  Future leaveSearchForGame({required int capacity, required BuildContext ctx}) async{
    emit(SfgInitial());
    await sfgWebServices.leaveSearchForGame(capacity: capacity
        , ctx: ctx
        , isInSearch: isInSearch);
    isInSearch = false;
    emit(SfgLeaveSearch());
  }

  Future joinGame({required BuildContext ctx, required int capacity,
    required String id}) async{
    emit(SfgInitial());
    await sfgWebServices.joinRoom(ctx: ctx, capacity: capacity, id: id);
    emit(SfgJoin());
  }

}
