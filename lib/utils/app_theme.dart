import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_style.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    indicatorColor: AppColors.blackColor,
    primaryColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
        centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.medium24Black,
      headlineLarge: AppStyles.bold16Black,
        labelMedium: AppStyles.medium14Black,
        // headlineMedium: AppStyles.medium24Black,
        titleLarge: AppStyles.medium24Black),

  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    indicatorColor: AppColors.whiteColor,
    primaryColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.blackColor,
          centerTitle: true,
      ),
    textTheme: TextTheme(
      labelLarge: AppStyles.medium24White,
      headlineLarge: AppStyles.bold16White,
      labelMedium: AppStyles.medium14White,
      //headlineMedium: AppStyles.medium24White,
      titleLarge: AppStyles.medium24White,
    ),

  );
}