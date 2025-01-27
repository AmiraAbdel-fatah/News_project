import 'package:flutter/material.dart';
import 'package:news/ui/home/news/news_item.dart';
import 'package:news/ui/home/view_full_article/web_view.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_style.dart';

import '../../../model/NewsResponse.dart';

class ViewFullArticle extends StatelessWidget {
  static const String routeName = 'View Full Article';

  const ViewFullArticle({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as News;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                NewsItem(news: args),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      // vertical: 10,
                      horizontal: 10),
                  margin: EdgeInsets.only(right: 15, left: 15, bottom: 80),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    args.description ?? '',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * .04, vertical: height * .02),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebView(news: args),
                    ));
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * .04, vertical: height * .02),
                  backgroundColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * .02,
                  ),
                  Text(
                    'View Full Article',
                    style: AppStyles.bold20Black,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
