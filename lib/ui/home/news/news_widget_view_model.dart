import 'package:flutter/cupertino.dart';
import 'package:news/api_constant/api_manager.dart';

import '../../../model/NewsResponse.dart';

class NewsWidgetViewModel extends ChangeNotifier {
  // todo: hold data - handel logic
  List<News>? newsList;
  String? errorMessage;

  void getNewsBySourceId(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);

      // todo: server => error
      if (response?.status == 'error') {
        errorMessage = response!.message!;
      } else {
        newsList = response!.articles;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
