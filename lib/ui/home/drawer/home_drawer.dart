import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/ui/home/drawer/section_drawer_item.dart';
import 'package:news/ui/home/drawer/theme_bottom_sheet.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_style.dart';
import 'package:news/utils/assets_manager.dart';
import 'package:provider/provider.dart';

import '../../../provider/app_language_provider.dart';
import '../../../provider/app_theme_provider.dart';
import 'language_bottom_sheet.dart';

class HomeDrawer extends StatefulWidget {
  Function onDrawerItemClicked;

  HomeDrawer({required this.onDrawerItemClicked});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric( vertical:  height * .07),
          height: height * 0.2,
          width: double.infinity,
          color: AppColors.whiteColor,
          child: Center(
            child: Text('News App',
              style: AppStyles.bold24Black,
            ),
          ),
        ),
        SizedBox(height: height*.02,),
        InkWell(
          onTap: (){
            // todo: go to home
            widget.onDrawerItemClicked();
          },
          child: SectionDrawerItem(
              imagePath: AssetsManager.homeIcon,
              text: AppLocalizations.of(context)!.go_to_home),
        ),
        Divider(color: AppColors.whiteColor, thickness: 2,indent: width* .04,endIndent: width*.06,),
        SizedBox(height: height*.02,),
        SectionDrawerItem(
            imagePath: AssetsManager.themeIcon,
            text: AppLocalizations.of(context)!.theme),
        InkWell(
          onTap: () {
            showThemeBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * .04),
            padding: EdgeInsets.symmetric(
                horizontal: width * .04, vertical: height * .02),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.whiteColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  themeProvider.appTheme == ThemeMode.dark
                      ? AppLocalizations.of(context)!.dark
                      : AppLocalizations.of(context)!.light,
                  style: AppStyles.medium20White,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.whiteColor,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: height*.02,),
        Divider(color: AppColors.whiteColor, thickness: 2,indent: width* .04,endIndent: width*.06),

        SectionDrawerItem(
            imagePath: AssetsManager.languageIcon,
            text: AppLocalizations.of(context)!.language),
        InkWell(
          onTap: () {
            showLanguageBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * .04),
            padding: EdgeInsets.symmetric(
                horizontal: width * .04, vertical: height * .02),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.whiteColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  languageProvider.appLanguage == 'en'
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                  style: AppStyles.medium20White,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.whiteColor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
