import 'package:flutter/material.dart';
import 'package:news/model/source_response.dart';

class SourseNameWidget extends StatelessWidget {
  bool isSelected ;
  Source source;
  SourseNameWidget({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(source.name ?? '',
      style:  isSelected ?
      Theme.of(context).textTheme.headlineLarge : Theme.of(context).textTheme.labelMedium,
    );
  }
}
