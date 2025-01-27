import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api_constant/api_manager.dart';

import 'news_state.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsViewModel() : super(NewsLoadingState());

  // todo: hold data - handel logic
  void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState());
      var response = await ApiManager.getNewsBySourceId(sourceId, 10);
      if (response!.status == 'error') {
        emit(NewsErrorState(errorMessage: response.message!));
        return;
      }
      if (response.status == 'ok') {
        emit(NewsSuccessState(newsList: response.articles!));
        return;
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
      return;
    }
  }
}
