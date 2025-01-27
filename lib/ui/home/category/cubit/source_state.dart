import '../../../../model/source_response.dart';

abstract class SourceState {} // parent class

//  child class
class SourceLoadingState extends SourceState {}

class SourceErrorState extends SourceState {
  String errorMessage;

  SourceErrorState({required this.errorMessage});
}

class SourceSuccessState extends SourceState {
  List<Source> sourcesList;

  SourceSuccessState({required this.sourcesList});
}

class ChangeSourceSelectedState extends SourceState {
  int selectedIndex;

  ChangeSourceSelectedState({required this.selectedIndex});
}
