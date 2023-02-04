import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/product/domain/usecase/get_products.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_event.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts _getProducts = locator.get();

  ProductBloc() : super(ProductInitState()) {
    on<ProductListRequest>(
      (event, emit) async {
        emit(ProductLoadingState());
        var productParams = ProductParams(filter: event.filter);
        var productList = await _getProducts.call(productParams);
        emit(ProductResponseState(
          productList: productList,
        ));
      },
    );
  }
}
