import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/ui/home/category/category_details.dart';
import 'package:news/ui/home/drawer/home_drawer.dart';
import 'package:news/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',style: Theme.of(context).textTheme.labelLarge ,),
      ),
      drawer: Drawer(child: HomeDrawer(),backgroundColor: AppColors.blackColor,),
      body: CategoryDetails(),
    );
  }
}
