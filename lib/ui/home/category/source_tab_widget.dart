import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/model/source_response.dart';
import 'package:news/ui/home/category/sourse_name_widget.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_style.dart';

class SourceTabWidget extends StatefulWidget {

  List<Source> sourceList ;
  SourceTabWidget({required this.sourceList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicatorColor: AppColors.blackColor,
          dividerColor: AppColors.transparentColor,
          onTap: (index){
            selectedIndex = index;
            setState(() {

            });
          },
            tabs: widget.sourceList.map((source){
              return SourseNameWidget(
                  source: source,
                  isSelected: selectedIndex == widget.sourceList.indexOf(source)
              );
            }).toList())
    );
  }
}
