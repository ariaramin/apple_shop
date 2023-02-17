import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/product/domain/usecase/get_product.dart';
import 'package:apple_shop/feature/product/domain/usecase/get_product_image.dart';
import 'package:apple_shop/feature/product/domain/usecase/get_product_variant.dart';
import 'package:apple_shop/feature/product/domain/usecase/get_products.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_event.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductList _getProductList = locator.get();
  final GetProduct _getProduct = locator.get();
  final GetProductVariant _getProductVariant = locator.get();
  final GetProductImage _getProductImage = locator.get();

  ProductBloc() : super(ProductInitState()) {
    on<ProductListRequest>(
      (event, emit) async {
        emit(ProductLoadingState());
        var productParams = ProductListParams(filter: event.filter);
        var productList = await _getProductList.call(productParams);
        emit(ProductListResponseState(
          productList: productList,
        ));
      },
    );

    on<ProductRequest>(
      (event, emit) async {
        emit(ProductLoadingState());
        // get product
        var productParams = ProductParams(productId: event.productId);
        var product = await _getProduct.call(productParams);
        // get product images
        var productImages = await _getProductImage.call(productParams);
        // get product variant
        var productVariants = await _getProductVariant.call(productParams);
        emit(ProductResponseState(
          product: product,
          productImageList: productImages,
          productVariantList: productVariants,
        ));
      },
    );
  }
}
