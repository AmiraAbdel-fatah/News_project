import 'package:flutter/cupertino.dart';
import 'package:news/api_constant/api_manager.dart';

import '../../../model/NewsResponse.dart';

class NewsWidgetViewModel extends ChangeNotifier {
  // todo: hold data - handel logic
  List<News>? newsList;
  String? errorMessage;
  int? newsNumber;
  int selectedIndex = 0;

  void getNewsBySourceId(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId, 10);

      // todo: server => error
      if (response?.status == 'error') {
        errorMessage = response!.message!;
      } else {
        newsList = response!.articles;
        newsNumber = response.totalResults;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void changeIndex(int newIndex) {
    selectedIndex = newIndex;
    notifyListeners();
  }
}
