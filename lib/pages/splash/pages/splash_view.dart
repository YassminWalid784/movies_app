import 'package:flutter/material.dart';

import '../../../core/config/pages_route_name.dart';
import '../../../main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () => navigatorKey.currentState!
          .pushReplacementNamed(PagesRouteName.layoutView),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/movies.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
