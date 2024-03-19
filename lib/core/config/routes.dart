import 'package:flutter/material.dart';
import 'package:movies_app/core/config/pages_route_name.dart';
import 'package:movies_app/pages/layout_view.dart';

import '../../pages/home/pages/home_view.dart';
import '../../pages/splash/pages/splash_view.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          // pass settings incase i sent an argument
          settings: settings,
        );

      case PagesRouteName.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );
      case PagesRouteName.layoutView:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
    }
  }
}
