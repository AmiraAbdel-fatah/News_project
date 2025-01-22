import 'package:flutter/cupertino.dart';
import 'package:news/api_constant/api_manager.dart';

import '../../../model/source_response.dart';

class SourceDetailsViewModel extends ChangeNotifier {
  // todo: hold data - handel logic
  List<Source>? sourcesList;
  String? errorMessage;

  void getSources(String categoryId) async {
    // todo: reinitialize
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        // todo: server => error
        errorMessage = response!.message!;
      } else {
        // todo: server => success
        sourcesList = response!.sources!;
      }
    } catch (e) {
      // todo: error => client
      errorMessage = 'Error load source list.';
      //  errorMessage = 'No Internet Connection.';
    }
    notifyListeners();
  }
}
