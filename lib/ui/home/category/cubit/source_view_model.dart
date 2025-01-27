import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api_constant/api_manager.dart';
import 'package:news/ui/home/category/cubit/source_state.dart';

class SourceViewModel extends Cubit<SourceState> {
  int selectedIndex = 0;

  SourceViewModel() : super(SourceLoadingState());

  // todo: hold data - handel logic
  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);
      // response => success or error
      if (response!.status == 'error') {
        emit(SourceErrorState(errorMessage: response.message!));
        return;
      }
      if (response.status == 'ok') {
        emit(SourceSuccessState(sourcesList: response.sources!));
        return;
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }

  void changeSelectedSource(int newIndex) {
    emit(ChangeSourceSelectedState(selectedIndex: newIndex));
  }
}
