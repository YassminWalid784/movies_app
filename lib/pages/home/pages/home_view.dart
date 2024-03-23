import 'package:flutter/material.dart';
import 'package:movies_app/pages/home/widget/new_realease_widget.dart';
import 'package:movies_app/pages/home/widget/popular_widget.dart';
import 'package:movies_app/pages/home/widget/top_rated_widget.dart';
import '../../../core/config/application_theme_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationThemeManager.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PopularWidget(),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFF282A28),
              ),
              child: const Column(
                children: [
                  Text(
                    "New Releases",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  NewRealeaseWidget(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFF282A28),
              ),
              child: const Column(
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TopRatedWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
