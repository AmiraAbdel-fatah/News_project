import 'package:flutter/material.dart';
import 'package:news/splash_screen.dart';
import 'package:news/ui/home/category/category_details.dart';
import 'package:news/ui/home/home_screen.dart';
import 'package:news/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      //themeMode: ThemeMode.dark,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CategoryDetails.routeName: (context) =>CategoryDetails(),
      },
    );
  }
}

