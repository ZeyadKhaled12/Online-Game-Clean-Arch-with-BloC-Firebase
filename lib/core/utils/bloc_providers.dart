
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/features/chat/data/chat_web_services.dart';
import 'package:kaito/features/profile/presentation/cubit/sfg_cubit.dart';

import '../../features/chat/presentation/cubit/chat_cubit.dart';
import '../../features/game/data/repositories/game_repository.dart';
import '../../features/game/data/web_services/game_web_services.dart';
import '../../features/game/presentation/cubit/game_cubit.dart';
import '../../features/profile/data/sfg_web_services.dart';
import '../../features/register/data/repositories/user_repository.dart';
import '../../features/register/data/web_services/user_web_services.dart';
import '../../features/register/presentation/cubit/user_cubit.dart';
import '../../features/room/data/repositories/room_repository.dart';
import '../../features/room/data/web_services/room_web_services.dart';
import '../../features/room/presentation/cubit/room_cubit.dart';
import '../../features/splash/data/repositories/splash_repository.dart';
import '../../features/splash/data/web_services/splash_web_services.dart';
import '../../features/splash/presentation/cubit/splash_cubit.dart';


List<BlocProvider> blocProviders = [
  BlocProvider<UserCubit>(create: (_) => UserCubit(UserRepository(UserWebServices()))),
  BlocProvider<SplashCubit>(create: (_) => SplashCubit(SplashRepository(SplashWebServices()))),
  BlocProvider<RoomCubit>(create: (_) => RoomCubit(RoomRepository(RoomWebServices()))),
  BlocProvider<GameCubit>(create: (_) => GameCubit(GameRepository(GameWebServices()))),
  BlocProvider<SfgCubit>(create: (_) => SfgCubit(SFGWebServices())),
  BlocProvider<ChatCubit>(create: (_) => ChatCubit(ChatWebServices())),
];
