import 'package:flutter/material.dart';
import 'package:news/model/category_model.dart';
import 'package:news/ui/home/category/category_fragment.dart';
import 'package:news/ui/home/category/source_details.dart';
import 'package:news/utils/app_colors.dart';

import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home' : selectedCategory!.title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      drawer: Drawer(
        child: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
        backgroundColor: AppColors.blackColor,
      ),
      body: selectedCategory == null
          ? CategoryFragment(
              onViewAllClicked: onViewAllClicked,
            )
          : SourceDetails(
              category: selectedCategory!,
            ),
    );
  }

  CategoryModel? selectedCategory;

  void onViewAllClicked(CategoryModel newSelectedCategory) {
    // todo: newSelectedCategory  => user select
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerItemClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
