import 'package:flutter/material.dart';
import 'package:news/api_constant/api_manager.dart';
import 'package:news/ui/home/view_full_article/view_full_article.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_style.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../model/NewsResponse.dart';
import '../../model/category_model.dart';
import '../home/news/news_item.dart';

class SearchScreen extends StatefulWidget {
  String source;

  SearchScreen({required this.source});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ScrollController scrollController = ScrollController();
  final ValueNotifier<bool> showPagination = ValueNotifier(false);
  int pageNumber = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    showPagination.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: FutureBuilder<NewsResponse?>(
            future: ApiManager.getNewsBySourceId(widget.source, pageNumber),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.greyColor,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        'No Internet Connection.',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ApiManager.getNewsBySourceId(
                                widget.source, pageNumber);
                            setState(() {});
                          },
                          child: Text(
                            'Try again',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ))
                    ],
                  ),
                );
              }
              if (snapshot.data!.status != 'ok') {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        snapshot.data!.message!,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ApiManager.getNewsBySourceId(
                                widget.source, pageNumber);
                            setState(() {});
                          },
                          child: Text(
                            'Try again',
                            style: AppStyles.medium20Black,
                          ))
                    ],
                  ),
                );
              }
              var newsList = snapshot.data!.articles!;
              print(newsList);
              if (newsList.isEmpty) {
                return Center(
                  child: Text(
                    'No data found!',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColors.blackColor),
                  ),
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        controller: scrollController,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(ViewFullArticle.routeName);
                              },
                              child: NewsItem(news: newsList[index]));
                        },
                        itemCount: newsList.length,
                      ),
                    ),
                    AnimatedBuilder(
                        animation: showPagination,
                        builder: (context, child) {
                          return showPagination.value
                              ? NumberPaginator(
                                  numberPages:
                                      snapshot.data!.totalResults! ~/ 10,
                                  initialPage: pageNumber - 1,
                                  onPageChange: (int index) {
                                    setState(() {
                                      pageNumber = index + 1;
                                    });
                                  },
                                )
                              : SizedBox.shrink();
                        }),
                  ],
                );
              }
            }));
  }

  CategoryModel? selectedCategory;

  void onViewAllClicked(CategoryModel newSelectedCategory) {
    // todo: newSelectedCategory  => user select
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      showPagination.value = true;
    } else {
      showPagination.value = false;
    }
  }
}
