import 'package:flutter/material.dart';

import '../../core/utils/strings_manager.dart';
import '../../features/random_quote/presentation/pages/random_quote_home.dart';

class Routes {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => Scaffold());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => QuoteScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route undefinedRoute() => MaterialPageRoute(
      builder: (_) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          ));
}
