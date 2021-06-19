import 'package:flutter/material.dart';

import '../ui/views/screens/index.dart';

/// Class that holds both route names & generate methods.
/// Used by the Flutter routing system
class Routes {
  /// Methods that generate all routes
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      switch (routeSettings.name) {
        case StartScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => StartScreen(),
          );
        case ChatScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => ChatScreen(),
          );
        case LoginScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => LoginScreen(),
          );
        case IntrodutionScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => IntrodutionScreen(),
          );
        case AppointScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => AppointScreen(),
          );

        case SymptomChatScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => SymptomChatScreen(),
          );
        case RegisterScreen.route:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => RegisterScreen(),
          );
        default:
          return errorRoute(routeSettings);
      }
    } catch (_) {
      return errorRoute(routeSettings);
    }
  }

  /// Method that called the error screen when necessary
  static Route<dynamic> errorRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => ErrorScreen(),
    );
  }
}
