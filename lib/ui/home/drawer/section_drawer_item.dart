import 'package:flutter/cupertino.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_style.dart';

class SectionDrawerItem extends StatelessWidget {
  String imagePath ;
  String text;
  SectionDrawerItem({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ImageIcon(AssetImage(imagePath),color: AppColors.whiteColor,),
          SizedBox(width: width *.02,),
          Text(text,style: AppStyles.bold20White,)
        ],
      ),
    );
  }
}
