import 'dart:developer';

import 'package:app_catalogo/core/error/exceptions.dart';
import 'package:app_catalogo/ui/products/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsRemoteDataSource {
  String apiUrl = 'https://fakestoreapi.com';

  Future<List<ProductModel>> getProductList() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/products'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      log(response.statusCode.toString());
      switch (response.statusCode) {
        case 200:
          // final jsonn = json.decode(response.body) as List;
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
