import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/model/source_response.dart';
import 'package:news/ui/home/news/cubit/news_state.dart';
import 'package:news/ui/home/news/cubit/news_view_model.dart';
import 'package:news/ui/home/news/news_item.dart';
import 'package:news/ui/home/view_full_article/view_full_article.dart';
import 'package:news/utils/app_colors.dart';
import 'package:number_paginator/number_paginator.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  // MVVM Provider
  //NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  // MVVM Bloc
  NewsViewModel viewModel = NewsViewModel();

  final ScrollController scrollController = ScrollController();
  final ValueNotifier<bool> showPagination = ValueNotifier(false);
  int pageNumber = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(scrollListener);
    viewModel.getNewsBySourceId(widget.source.id ?? '');
    print(widget.source.id);
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      showPagination.value = true;
    } else {
      showPagination.value = false;
    }
  }

  void dispose() {
    scrollController.dispose();
    showPagination.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          } else if (state is NewsErrorState) {
            return Center(
              child: Column(
                children: [
                  Text(
                    state.errorMessage,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getNewsBySourceId(widget.source.id ?? '');
                      },
                      child: Text(
                        'Try again',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ))
                ],
              ),
            );
          } else if (state is NewsSuccessState) {
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
                          Navigator.of(context).pushNamed(
                              ViewFullArticle.routeName,
                              arguments: state.newsList[index]);
                        },
                        child: NewsItem(news: state.newsList[index]),
                      );
                    },
                    itemCount: state.newsList.length,
                  ),
                ),
                AnimatedBuilder(
                    animation: showPagination,
                    builder: (context, child) {
                      return showPagination.value
                          ? NumberPaginator(
                              config: NumberPaginatorUIConfig(
                                  buttonSelectedBackgroundColor:
                                      Theme.of(context).primaryColor,
                                  buttonUnselectedForegroundColor:
                                      Theme.of(context).primaryColor),
                              // by default, the pagination shows numbers as center content
                              numberPages: state.newsNumber! ~/ 10,
                              initialPage: pageNumber - 1,
                              onPageChange: (int index) {
                                setState(() {
                                  pageNumber = index + 1;
                                });
                              },
                            )
                          : SizedBox
                              .shrink(); // Hide widget when not at the bottom
                    })
              ],
            );
          }
          return Container(); //  unreachable
        });

    // BlocConsumer<NewsViewModel , NewsState>(
    //     listener: (context , state){
    //
    //     },
    //     builder: (context, state) {
    //       if (state is NewsLoadingState) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: AppColors.greyColor,
    //           ),
    //         );
    //       } else if (state is NewsErrorState) {
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text(
    //                 state.errorMessage,
    //                 style: Theme
    //                     .of(context)
    //                     .textTheme
    //                     .headlineLarge,
    //               ),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     viewModel.getNewsBySourceId(widget.source.id ?? '');
    //                   },
    //                   child: Text(
    //                     'Try again',
    //                     style: Theme
    //                         .of(context)
    //                         .textTheme
    //                         .headlineLarge,
    //                   ))
    //             ],
    //           ),
    //         );
    //       } else if (state is NewsSuccessState) {
    //         return ListView.builder(
    //           itemBuilder: (context, index) {
    //             return NewsItem(news: state.newsList[index]);
    //           },
    //           itemCount: state.newsList.length,
    //         );
    //       }
    //       return Container();
    //     }
    // );

    // return ChangeNotifierProvider(
    //     create: (context) => viewModel,
    //     child: Consumer<NewsWidgetViewModel>(
    //         child: Text(
    //           'Hello',
    //           style: Theme.of(context).textTheme.headlineMedium,
    //         ),
    //         builder: (context, viewModel, child) {
    //           if (viewModel.errorMessage != null) {
    //             // todo: error (server - client)
    //             return Center(
    //               child: Column(
    //                 children: [
    //                   Text(
    //                     viewModel.errorMessage!,
    //                     style: Theme.of(context).textTheme.headlineLarge,
    //                   ),
    //                   ElevatedButton(
    //                       onPressed: () {
    //                         viewModel.getNewsBySourceId(widget.source.id ?? '');
    //                       },
    //                       child: Text(
    //                         'Try again',
    //                         style: Theme.of(context).textTheme.headlineLarge,
    //                       ))
    //                 ],
    //               ),
    //             );
    //           } else if (viewModel.newsList == null) {
    //             return Center(
    //               child: CircularProgressIndicator(
    //                 color: AppColors.greyColor,
    //               ),
    //             );
    //           } else {
    //             return ListView.builder(
    //               itemBuilder: (context, index) {
    //                 return Column(
    //                   children: [
    //                     child!,
    //                     NewsItem(news: viewModel.newsList![index]),
    //                   ],
    //                 );
    //               },
    //               itemCount: viewModel.newsList!.length,
    //             );
    //           }
    //         })
    //
    //     // FutureBuilder<NewsResponse?>(
    //     //     future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
    //     //     builder: (context,snapshot){
    //     //       if(snapshot.connectionState ==ConnectionState.waiting){
    //     //         return Center(child: CircularProgressIndicator(color: AppColors.greyColor,),);
    //     //       }
    //     //       else if(snapshot.hasError){
    //     //         return Center(
    //     //                 child: Column(
    //     //                 children: [
    //     //                 Text('No Internet Connection.',
    //     //                 style: Theme.of(context).textTheme.headlineLarge,),
    //     //             ElevatedButton(onPressed: (){
    //     //               ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //     //               setState(() {
    //     //
    //     //               });
    //     //             },
    //     //                 child: Text('Try again',
    //     //               style: Theme.of(context).textTheme.headlineLarge,))
    //     //           ],
    //     //         ),
    //     //       );
    //     //       }
    //     //       if(snapshot.data!.status != 'ok'){
    //     //         return Center(
    //     //           child: Column(
    //     //             children: [
    //     //               Text(snapshot.data!.message!,
    //     //                 style: Theme.of(context).textTheme.headlineLarge,),
    //     //               ElevatedButton(onPressed: (){
    //     //                 ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //     //                 setState(() {
    //     //
    //     //                 });
    //     //               }, child: Text('Try again',
    //     //                 style: Theme.of(context).textTheme.headlineLarge,))
    //     //             ],
    //     //           ),
    //     //         );
    //     //       }
    //     //       var newsList = snapshot.data!.articles!;
    //     //       return ListView.builder(
    //     //           itemBuilder: (context,index){
    //     //             return NewsItem(news: newsList[index]);
    //     //           },
    //     //         itemCount: newsList.length,
    //     //       );
    //     //     }
    //     // ),
    //     );
  }
}
