
import 'package:flutter/material.dart';
import 'package:kaito/config/routes/routes_names.dart';
import 'package:kaito/features/chat/presentation/screens/chat_screen.dart';

import '../../features/game/presentation/screens/game_check_if_kaito_screen.dart';
import '../../features/game/presentation/screens/game_imposter_or_not_screen.dart';
import '../../features/game/presentation/screens/game_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/profile/presentation/screens/profile_sfg_screen.dart';
import '../../features/register/presentation/screens/give_name_screen.dart';
import '../../features/room/presentation/screens/room_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';



class AppRoutes{

  static Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case RoutesNames.initRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesNames.giveNameScreen:
        return MaterialPageRoute(builder: (context) => const GiveNameScreen());
      case RoutesNames.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case RoutesNames.gameImposterOrNotScreen:
        return MaterialPageRoute(builder: (context) => const GameImposterOrNotScreen());
      case RoutesNames.gameScreen:
        return MaterialPageRoute(builder: (context) => const GameScreen());
      case RoutesNames.roomScreen:
        return MaterialPageRoute(builder: (context) => const RoomScreen(
          isSearchGame: false));
      case RoutesNames.profileSFGScreen:
        return MaterialPageRoute(builder: (context) => const ProfileSFGScreen(capacity: 0));
      case RoutesNames.gameCheckIfKaitoScreen:
        return MaterialPageRoute(builder: (context) => const GameCheckIfKaitoScreen(token: ''));
    }
    return null;
  }
}