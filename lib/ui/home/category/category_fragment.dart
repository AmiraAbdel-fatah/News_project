import 'package:flutter/material.dart';
import 'package:news/model/category_model.dart';
import 'package:news/provider/app_theme_provider.dart';
import 'package:news/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryFragment extends StatelessWidget {
  List<CategoryModel> categoriesList = [];
  Function onViewAllClicked;

  CategoryFragment({required this.onViewAllClicked});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppThemeProvider>(context);
    categoriesList = CategoryModel.getCategoriesList(provider.isDarkMode());

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: height * .02,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      child: Stack(
                        alignment: index % 2 == 0
                            ? Alignment.bottomRight
                            : Alignment.bottomLeft,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child:
                                  Image.asset(categoriesList[index].imagePath)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * .01,
                                vertical: height * .02),
                            child: ToggleSwitch(
                              customWidths: [width * .25, width * .15],
                              cornerRadius: 20.0,
                              activeBgColors: [
                                [Theme.of(context).primaryColor],
                                [AppColors.greyColor]
                              ],
                              activeFgColor: Colors.white,
                              inactiveBgColor: AppColors.greyColor,
                              inactiveFgColor: Colors.white,
                              animate: true,
                              initialLabelIndex: 1,
                              totalSwitches: 2,
                              customWidgets: [
                                Text(
                                  'View All',
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                                CircleAvatar(
                                  backgroundColor: AppColors.blackColor,
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: AppColors.whiteColor,
                                  ),
                                )
                              ],
                              radiusStyle: true,
                              onToggle: (index1) {
                                print('switched to: $index');
                                onViewAllClicked(categoriesList[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height * .02,
                    );
                  },
                  itemCount: categoriesList.length)),
        ],
      ),
    );
  }
}
