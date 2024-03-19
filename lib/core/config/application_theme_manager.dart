
import 'package:flutter/material.dart';

class ApplicationThemeManager
{
  static const Color primaryColor = Color(0xFF121312);
  static ThemeData applicationThemeData = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF121312),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor:Color(0xFF1A1A1A),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFFFBB3B),
        selectedLabelStyle: TextStyle(
          fontFamily: "Inter",
          fontSize: 8,
          fontWeight: FontWeight.normal,
          color: Color(0xFFFFB224),
        ),
        selectedIconTheme: IconThemeData(
          color: Color(0xFFFFBB3B),
        ),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(
            fontFamily: "Inter",
            color: Colors.white,
            fontSize: 8,
            fontWeight: FontWeight.normal
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
        )
    ),
  );
}