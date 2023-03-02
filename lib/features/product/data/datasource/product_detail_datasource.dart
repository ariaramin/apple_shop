import 'package:apple_shop/config/utility/api_exception.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/category/data/models/category.dart';
import 'package:apple_shop/features/product/data/models/product_image_model.dart';
import 'package:apple_shop/features/product/data/models/product_variant.dart';
import 'package:apple_shop/features/product/data/models/property.dart';
import 'package:apple_shop/features/product/data/models/variant.dart';
import 'package:apple_shop/features/product/data/models/variant_type.dart';
import 'package:dio/dio.dart';

abstract class IProductDetailDatasource {
  Future<List<ProductImageModel>> getGallery(String productId);
  Future<List<VariantType>> getVariantTypes();
  Future<List<Variant>> getVariant(String productId);
  Future<List<ProductVariant>> getProductVariants(String productId);
  Future<Category> getProductCategory(String categoryId);
  Future<List<Property>> getProductProperties(String productId);
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
      if (variant.isNotEmpty) {
        productVariantList.add(
          ProductVariant(
            variantList: variant,
            variantType: variantType,
          ),
        );
      }
    }

    return productVariantList;
  }

  @override
  Future<Category> getProductCategory(String categoryId) async {
    try {
      var respones = await _dio.get(
        "collections/category/records",
        queryParameters: {
          'filter': "id='$categoryId'",
        },
      );
      var items = respones.data["items"] as List;
      return items
          .map<Category>((item) => Category.fromMapJson(item))
          .toList()[0];
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
  Future<List<Property>> getProductProperties(String productId) async {
    try {
      var respones = await _dio.get(
        "collections/properties/records",
        queryParameters: {
          'filter': "product_id='$productId'",
        },
      );
      var items = respones.data["items"] as List;
      return items.map<Property>((item) => Property.fromMapJson(item)).toList();
    } on DioError catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data["message"],
      );
    } catch (ex) {
      throw const ApiException(0, "خطای نامشخص");
    }
  }
}
