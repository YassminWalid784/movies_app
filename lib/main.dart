import 'package:flutter/material.dart';

import 'core/config/application_theme_manager.dart';
import 'core/config/pages_route_name.dart';
import 'core/config/routes.dart';


GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.applicationThemeData,
      themeMode: ThemeMode.light,
      initialRoute: PagesRouteName.initial,
      onGenerateRoute: Routes.onGenerateRoute,
      navigatorKey: navigatorKey,
    );
  }
}
