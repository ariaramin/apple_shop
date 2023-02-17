import 'package:apple_shop/config/utility/filter.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/product/domain/usecase/get_products.dart';
import 'package:apple_shop/feature/search/presentation/bloc/search_event.dart';
import 'package:apple_shop/feature/search/presentation/bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetProductList _getProducts = locator.get();

  SearchBloc() : super(SearchInitState()) {
    on<SearchRequest>(
      (event, emit) async {
        emit(SearchLoadingState());
        var filter = Filter(
            filterSequence:
                "name~'${event.text}' && description~'${event.text}' && category.title~'${event.text}'");
        var productParams = ProductListParams(filter: filter);
        var productList = await _getProducts.call(productParams);
        emit(SearchResponseState(
          productList: productList,
        ));
      },
    );
  }
}
