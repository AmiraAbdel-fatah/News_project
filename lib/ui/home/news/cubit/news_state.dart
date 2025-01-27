import '../../../../model/NewsResponse.dart';

abstract class NewsState {}

class NewsLoadingState extends NewsState {}

class NewsErrorState extends NewsState {
  String errorMessage;

  NewsErrorState({required this.errorMessage});
}

class NewsSuccessState extends NewsState {
  List<News> newsList;
  int? newsNumber;

  NewsSuccessState({this.newsNumber, required this.newsList});
}
