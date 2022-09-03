import 'dart:developer';

import 'package:app_catalogo/core/error/exceptions.dart';
import 'package:app_catalogo/core/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsRemoteDataSource {
  String apiUrl = 'https://retoolapi.dev/2XpavB';

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/catalog'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      switch (response.statusCode) {
        case 200:
          return productModelFromJson(response.body);
        case 400:
          throw ServerException();
        default:
          throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<List<ProductModel>> getProductsByCategory(
    String category,
    int page,
  ) async {
    final uri = category == CATEGORY_ALL
        ? Uri.parse('$apiUrl/catalog?_page=$page&_limit=5')
        : Uri.parse('$apiUrl/catalog?_page=$page&_limit=5&category=$category');
    try {
      final response = await http.get(
        uri,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      log(response.statusCode.toString());
      switch (response.statusCode) {
        case 200:
          return productModelFromJson(response.body);
        case 400:
          throw ServerException();
        default:
          throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
