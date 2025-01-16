import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_style.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
        centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.medium24Black,
      headlineLarge: AppStyles.bold16Black,
      headlineMedium: AppStyles.medium14Black
    ),

  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
      primaryColor: AppColors.blackColor,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.blackColor,
          centerTitle: true,
      ),
    textTheme: TextTheme(
      labelLarge: AppStyles.medium24White,
      headlineLarge: AppStyles.bold16White,
      headlineMedium: AppStyles.medium14White
    ),

  );
}