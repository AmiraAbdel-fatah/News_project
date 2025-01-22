import 'package:flutter/material.dart';
import 'package:news/model/category_model.dart';
import 'package:news/ui/home/category/source_details_view_model.dart';
import 'package:news/ui/home/category/source_tab_widget.dart';
import 'package:news/utils/app_colors.dart';
import 'package:provider/provider.dart';

class SourceDetails extends StatefulWidget {
  CategoryModel category;

  SourceDetails({required this.category});

  @override
  State<SourceDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<SourceDetails> {
  SourceDetailsViewModel viewModel = SourceDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<SourceDetailsViewModel>(
            builder: (context, viewModel, child) {
          // todo: error
          if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                children: [
                  Text(
                    viewModel.errorMessage!,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getSources(widget.category.id);
                      },
                      child: Text(
                        'Try again',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ))
                ],
              ),
            );
          }
          if (viewModel.sourcesList == null) {
            // todo: loading
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          } else {
            // todo: success
            return SourceTabWidget(sourceList: viewModel.sourcesList!);
          }
        })

        // FutureBuilder(
        //     future: ApiManager.getSources(widget.category.id),
        //     builder: (context , snapshot){
        //       if(snapshot.connectionState == ConnectionState.waiting){
        //         return Center(child: CircularProgressIndicator(
        //           color: AppColors.greyColor,
        //         ),);
        //       }
        //       // error => client
        //       else if(snapshot.hasError){
        //         return Center(
        //           child: Column(
        //             children: [
        //               Text('No Internet Connection.',
        //                 style: Theme.of(context).textTheme.headlineLarge,),
        //               ElevatedButton(onPressed: (){
        //                 ApiManager.getSources(widget.category.id);
        //                 setState(() {
        //
        //                 });
        //               }, child: Text('Try again',
        //                 style: Theme.of(context).textTheme.headlineLarge,))
        //             ],
        //           ),
        //         );
        //       }
        //       // server ==> response  (success , error)
        //       // error
        //       if(snapshot.data!.status != 'ok'){
        //         return Center(
        //           child: Column(
        //             children: [
        //               Text(snapshot.data!.message!,
        //                 style: Theme.of(context).textTheme.headlineLarge,),
        //               ElevatedButton(onPressed: (){
        //                 ApiManager. getSources(widget.category.id);
        //                 setState(() {
        //
        //                 });
        //               }, child: Text('Try again',
        //                 style: Theme.of(context).textTheme.headlineLarge,))
        //             ],
        //           ),
        //         );
        //       }
        //       // server ==> data
        //       var sourceList = snapshot.data!.sources ?? [];
        //       return SourceTabWidget(sourceList: sourceList);
        //     }
        // ),
        );
  }
}
