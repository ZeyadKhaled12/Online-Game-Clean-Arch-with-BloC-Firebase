part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashWhenAppOpen extends SplashState{}

class SplashAndroidId extends SplashState{}

class SplashCheckIfAndroidExist extends SplashState{}

class SplashNavigate extends SplashState{}

class SplashCheckUpdate extends SplashState{}
