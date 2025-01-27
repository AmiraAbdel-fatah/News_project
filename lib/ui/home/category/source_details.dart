import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/model/category_model.dart';
import 'package:news/ui/home/category/cubit/source_state.dart';
import 'package:news/ui/home/category/cubit/source_view_model.dart';
import 'package:news/ui/home/category/source_tab_widget.dart';
import 'package:news/utils/app_colors.dart';

class SourceDetails extends StatefulWidget {
  CategoryModel category;

  SourceDetails({required this.category});

  @override
  State<SourceDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<SourceDetails> {
  // MVVM
  // SourceDetailsViewModel viewModel = SourceDetailsViewModel();

  // Bloc
  SourceViewModel viewModel = SourceViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourceViewModel, SourceState>(
        bloc: viewModel,
        // used only if i have one widget listen o bloc provider
        builder: (context, state) {
          // check type of object
          if (state is SourceLoadingState) {
            // todo: loading
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          } else if (state is SourceErrorState) {
            // todo: error
            return Center(
              child: Column(
                children: [
                  Text(
                    state.errorMessage,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getSources(widget.category.id);
                      },
                      child: Text(
                        'Try again',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ))
                ],
              ),
            );
          } else if (state is SourceSuccessState) {
            return SourceTabWidget(sourceList: state.sourcesList);
          }
          return Container(); // unreachable
        });

    // return ChangeNotifierProvider(
    //     create: (context) => viewModel,
    //     child: Consumer<SourceDetailsViewModel>(
    //         builder: (context, viewModel, child) {
    //       // todo: error
    //       if (viewModel.errorMessage != null) {
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text(
    //                 viewModel.errorMessage!,
    //                 style: Theme.of(context).textTheme.headlineLarge,
    //               ),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     viewModel.getSources(widget.category.id);
    //                   },
    //                   child: Text(
    //                     'Try again',
    //                     style: Theme.of(context).textTheme.headlineLarge,
    //                   ))
    //             ],
    //           ),
    //         );
    //       }
    //       if (viewModel.sourcesList == null) {
    //         // todo: loading
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: AppColors.greyColor,
    //           ),
    //         );
    //       } else {
    //         // todo: success
    //         return SourceTabWidget(sourceList: viewModel.sourcesList!);
    //       }
    //     })
    //
    //     // FutureBuilder(
    //     //     future: ApiManager.getSources(widget.category.id),
    //     //     builder: (context , snapshot){
    //     //       if(snapshot.connectionState == ConnectionState.waiting){
    //     //         return Center(child: CircularProgressIndicator(
    //     //           color: AppColors.greyColor,
    //     //         ),);
    //     //       }
    //     //       // error => client
    //     //       else if(snapshot.hasError){
    //     //         return Center(
    //     //           child: Column(
    //     //             children: [
    //     //               Text('No Internet Connection.',
    //     //                 style: Theme.of(context).textTheme.headlineLarge,),
    //     //               ElevatedButton(onPressed: (){
    //     //                 ApiManager.getSources(widget.category.id);
    //     //                 setState(() {
    //     //
    //     //                 });
    //     //               }, child: Text('Try again',
    //     //                 style: Theme.of(context).textTheme.headlineLarge,))
    //     //             ],
    //     //           ),
    //     //         );
    //     //       }
    //     //       // server ==> response  (success , error)
    //     //       // error
    //     //       if(snapshot.data!.status != 'ok'){
    //     //         return Center(
    //     //           child: Column(
    //     //             children: [
    //     //               Text(snapshot.data!.message!,
    //     //                 style: Theme.of(context).textTheme.headlineLarge,),
    //     //               ElevatedButton(onPressed: (){
    //     //                 ApiManager. getSources(widget.category.id);
    //     //                 setState(() {
    //     //
    //     //                 });
    //     //               }, child: Text('Try again',
    //     //                 style: Theme.of(context).textTheme.headlineLarge,))
    //     //             ],
    //     //           ),
    //     //         );
    //     //       }
    //     //       // server ==> data
    //     //       var sourceList = snapshot.data!.sources ?? [];
    //     //       return SourceTabWidget(sourceList: sourceList);
    //     //     }
    //     // ),
    //     );
  }
}
