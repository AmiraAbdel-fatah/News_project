import 'package:flutter/material.dart';
import 'package:news/model/source_response.dart';
import 'package:news/ui/home/news/news_item.dart';
import 'package:news/ui/home/news/news_widget_view_model.dart';
import 'package:news/utils/app_colors.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<NewsWidgetViewModel>(
            child: Text(
              'Hello',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            builder: (context, viewModel, child) {
              if (viewModel.errorMessage != null) {
                // todo: error (server - client)
                return Center(
                  child: Column(
                    children: [
                      Text(
                        viewModel.errorMessage!,
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
              } else if (viewModel.newsList == null) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.greyColor,
                  ),
                );
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        child!,
                        NewsItem(news: viewModel.newsList![index]),
                      ],
                    );
                  },
                  itemCount: viewModel.newsList!.length,
                );
              }
            })

        // FutureBuilder<NewsResponse?>(
        //     future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
        //     builder: (context,snapshot){
        //       if(snapshot.connectionState ==ConnectionState.waiting){
        //         return Center(child: CircularProgressIndicator(color: AppColors.greyColor,),);
        //       }
        //       else if(snapshot.hasError){
        //         return Center(
        //                 child: Column(
        //                 children: [
        //                 Text('No Internet Connection.',
        //                 style: Theme.of(context).textTheme.headlineLarge,),
        //             ElevatedButton(onPressed: (){
        //               ApiManager.getNewsBySourceId(widget.source.id ?? '');
        //               setState(() {
        //
        //               });
        //             },
        //                 child: Text('Try again',
        //               style: Theme.of(context).textTheme.headlineLarge,))
        //           ],
        //         ),
        //       );
        //       }
        //       if(snapshot.data!.status != 'ok'){
        //         return Center(
        //           child: Column(
        //             children: [
        //               Text(snapshot.data!.message!,
        //                 style: Theme.of(context).textTheme.headlineLarge,),
        //               ElevatedButton(onPressed: (){
        //                 ApiManager.getNewsBySourceId(widget.source.id ?? '');
        //                 setState(() {
        //
        //                 });
        //               }, child: Text('Try again',
        //                 style: Theme.of(context).textTheme.headlineLarge,))
        //             ],
        //           ),
        //         );
        //       }
        //       var newsList = snapshot.data!.articles!;
        //       return ListView.builder(
        //           itemBuilder: (context,index){
        //             return NewsItem(news: newsList[index]);
        //           },
        //         itemCount: newsList.length,
        //       );
        //     }
        // ),
        );
  }
}
