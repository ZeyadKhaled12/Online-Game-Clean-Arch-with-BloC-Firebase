part of 'sfg_cubit.dart';

@immutable
abstract class SfgState {}

class SfgInitial extends SfgState {}

class SfgSearch extends SfgState {}

class SfgLeaveSearch extends SfgState {}

class SfgJoin extends SfgState {}
