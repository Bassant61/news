import 'package:flutter/material.dart';
import 'package:newsapp/news_app/core/theme/app_colors.dart';

class AppTheme{
  static final ThemeData _LightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whitecolor,
    primaryColor: AppColors.whitecolor,
    shadowColor: AppColors.blackcolor.withOpacity(0.19),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whitecolor,
      selectedItemColor: AppColors.blackcolor,
      unselectedItemColor: Colors.grey
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        color:AppColors.blackcolor,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
      backgroundColor: AppColors.whitecolor,
      elevation: 0
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.blackcolor
      ),
      headlineMedium:TextStyle(
        color: Colors.grey
      ) 
    ),
  );
  static final ThemeData _DarkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackcolor,
    primaryColor: AppColors.blackcolor,
    shadowColor: AppColors.whitecolor.withOpacity(0.19),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.blackcolor,
      selectedItemColor: AppColors.whitecolor,
      unselectedItemColor: Colors.grey
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        color:AppColors.whitecolor,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
      backgroundColor: AppColors.blackcolor
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.whitecolor
      ),
      headlineMedium:TextStyle(
        color: Colors.grey
      )
    )
  );
  static getLightTheme()=> _LightTheme;
  static getDarkTheme()=> _DarkTheme;
}