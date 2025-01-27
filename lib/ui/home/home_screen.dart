import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:news/model/category_model.dart';
import 'package:news/ui/home/category/category_fragment.dart';
import 'package:news/ui/home/category/source_details.dart';
import 'package:news/ui/search/search_screen.dart';
import 'package:news/utils/app_colors.dart';

import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            // isSearching ? CustomTextField(
            //   hintText: 'Search',
            //   hintStyle: Theme.of(context).textTheme.labelMedium,
            //   prefixIcon: Icon(Icons.search,color: AppColors.whiteColor,),
            //   controller: searchController,
            //   style: Theme.of(context).textTheme.headlineLarge,
            //
            // ) :
            Text(
          selectedCategory == null ? 'Home' : selectedCategory!.title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        actions: [
          // IconButton(
          //     onPressed: (){
          //       setState(() {
          //         isSearching = !isSearching;
          //         if (!isSearching) {
          //           searchController.clear();
          //           //search('searchController');
          //         }
          //       });
          //     },
          //     icon: Icon(isSearching ? Icons.close : Icons.search)
          // )

          Padding(
            padding: const EdgeInsets.only(right: 13),
            child: AnimSearchBar(
              width: MediaQuery.of(context).size.width * .8,
              textController: searchController,
              onSuffixTap: () {
                searchController.clear();
                print("suffix");
              },
              onSubmitted: (string) {
                search(string);
                print("submit");
              },
              rtl: true,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
        backgroundColor: AppColors.blackColor,
      ),
      body: selectedQuery != null
          ? SearchScreen(source: selectedQuery!)
          : check == 1
              ? HomeDrawer(onDrawerItemClicked: onDrawerItemClicked)
              : selectedCategory == null
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

  int check = 0;
  String? selectedQuery = null;

  void search(String query) {
    selectedQuery = query;
    setState(() {});
  }
}
