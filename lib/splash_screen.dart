import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/provider/app_theme_provider.dart';
import 'package:news/ui/home/home_screen.dart';
import 'package:news/utils/assets_manager.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'Splash Screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final bool isDarkMode = themeProvider.isDarkMode();

    final String splashImage = isDarkMode
        ? AssetsManager.splashDarkImage
        : AssetsManager.splashLightImage;
    final String brandingImage = isDarkMode
        ? AssetsManager.brandingDarkImage
        : AssetsManager.brandingLightImage;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Image.asset(splashImage),
            Spacer(),
            Image.asset(brandingImage)
          ],
        ),
      ),
    );
  }
}
