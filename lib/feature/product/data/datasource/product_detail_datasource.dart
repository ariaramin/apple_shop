import 'package:apple_shop/config/utility/api_exception.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/product/data/model/product_image_model.dart';
import 'package:apple_shop/feature/product/data/model/product_variant.dart';
import 'package:apple_shop/feature/product/data/model/variant.dart';
import 'package:apple_shop/feature/product/data/model/variant_type.dart';
import 'package:dio/dio.dart';

abstract class IProductDetailDatasource {
  Future<List<ProductImageModel>> getGallery(String productId);
  Future<List<VariantType>> getVariantTypes();
  Future<List<Variant>> getVariant(String productId);
  Future<List<ProductVariant>> getProductVariants(String productId);
}

class ProductDetailDatasource extends IProductDetailDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImageModel>> getGallery(String productId) async {
    try {
      var respones = await _dio.get(
        'collections/gallery/records',
        queryParameters: {
          'filter': 'product_id="$productId"',
        },
      );
      return respones.data['items']
          .map<ProductImageModel>(
              (jsonObject) => ProductImageModel.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data["message"],
      );
    } catch (ex) {
      throw const ApiException(0, "خطای نامشخص");
    }
  }

  @override
  Future<List<VariantType>> getVariantTypes() async {
    try {
      var respones = await _dio.get('collections/variants_type/records');

      return respones.data['items']
          .map<VariantType>((jsonObject) => VariantType.fromMapjson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data["message"],
      );
    } catch (ex) {
      throw const ApiException(0, "خطای نامشخص");
    }
  }

  @override
  Future<List<Variant>> getVariant(String productId) async {
    try {
      var respones = await _dio.get(
        'collections/variants/records',
        queryParameters: {
          'filter': 'product_id="$productId"',
        },
      );
      return respones.data['items']
          .map<Variant>((jsonObject) => Variant.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data["message"],
      );
    } catch (ex) {
      throw const ApiException(0, "خطای نامشخص");
    }
  }

  @override
  Future<List<ProductVariant>> getProductVariants(String productId) async {
    var variantTypeList = await getVariantTypes();
    var variantList = await getVariant(productId);
    List<ProductVariant> productVariantList = [];

    for (var variantType in variantTypeList) {
      var variant = variantList
          .where((element) => element.typeId == variantType.id)
          .toList();
      productVariantList.add(
        ProductVariant(
          variantList: variant,
          variantType: variantType,
        ),
      );
    }

    return productVariantList;
  }
}
