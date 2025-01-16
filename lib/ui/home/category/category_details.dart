import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/api_constant/api_manager.dart';
import 'package:news/ui/home/category/source_tab_widget.dart';
import 'package:news/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'Category details';
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context , snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(
              color: AppColors.greyColor,
            ),);
          }
          else if(snapshot.hasError){
            return Column(
              children: [
                Text('Error'),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources();
                  setState(() {

                  });
                }, child: Text('Try again'))
              ],
            );
          }
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources();
                  setState(() {

                });
                  }, child: Text('Try again'))
              ],
            );
          }
          var sourceList = snapshot.data!.sources ?? [];
          return SourceTabWidget(sourceList: sourceList);
        }
    );
  }
}
