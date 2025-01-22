import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_style.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    var _timestamp = news.publishedAt ?? '';
    var time = DateTime.now().subtract(Duration(minutes: 20));
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: width * .04, vertical: height * .01),
      padding:
          EdgeInsets.symmetric(horizontal: width * .02, vertical: height * .01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 2, color: Theme.of(context).indicatorColor),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              height: height * .25,
              width: double.infinity,
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: AppColors.greyColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          Text(
            news.title ?? '',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: height * .02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                'By: ${news.author ?? ''}',
                style: AppStyles.medium12Grey,
              )),
              Expanded(
                  child: Text(
                timeago.format(time),
                textAlign: TextAlign.end,
                style: AppStyles.medium12Grey,
              )),
            ],
          )
        ],
      ),
    );
  }
//   formatedTime(){
//final fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));
//
//   print(timeago.format(fifteenAgo)); // 15 minutes ago
//   print(timeago.format(fifteenAgo, locale: 'en_short')); // 15m
//   print(timeago.format(fifteenAgo, locale: 'es')); // hace 15 minutos
// }
}
