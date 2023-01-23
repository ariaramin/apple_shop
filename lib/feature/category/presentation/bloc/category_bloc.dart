import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/category/domain/usecase/get_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategories _getCategories = locator.get();

  CategoryBloc() : super(CategoryInitState()) {
    on<CategoryRequest>(
      (event, emit) async {
        emit(CategoryLoadingState());
        var response = await _getCategories.call(null);
        emit(CategoryResponseState(response));
      },
    );
  }
}
