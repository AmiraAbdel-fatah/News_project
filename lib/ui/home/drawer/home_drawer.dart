import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/ui/home/drawer/section_drawer_item.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_style.dart';
import 'package:news/utils/assets_manager.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
          },
          child: SectionDrawerItem(
              imagePath: AssetsManager.homeIcon,
              text: 'Go To Home'),
        ),
        Divider(color: AppColors.whiteColor, thickness: 2,indent: width* .04,endIndent: width*.06,),
        SizedBox(height: height*.02,),
        SectionDrawerItem(
            imagePath: AssetsManager.themeIcon,
            text: 'Theme'),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width *.04),
          padding: EdgeInsets.symmetric(
            horizontal: width *.04,
            vertical: height *.02
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.whiteColor
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dark', style: AppStyles.medium20White,),
              Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,)
            ],
          ),
        ),
        SizedBox(height: height*.02,),
        Divider(color: AppColors.whiteColor, thickness: 2,indent: width* .04,endIndent: width*.06),

        SectionDrawerItem(
            imagePath: AssetsManager.languageIcon,
            text: 'Language'),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width *.04),
          padding: EdgeInsets.symmetric(
              horizontal: width *.04,
              vertical: height *.02
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: AppColors.whiteColor
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('English', style: AppStyles.medium20White,),
              Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,)
            ],
          ),
        ),
      ],
    );
  }
}
