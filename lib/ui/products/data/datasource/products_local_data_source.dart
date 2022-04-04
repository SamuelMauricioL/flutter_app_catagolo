import 'package:app_catalogo/core/error/exceptions.dart';
import 'package:app_catalogo/core/models/product_model.dart';
import 'package:app_catalogo/core/storage/storage.dart';

const CACHED_PRODUCTS = 'CACHED_PRODUCTS';

class ProductsLocalDataSource {
  ProductsLocalDataSource({required this.storage});

  final Storage storage;

  void cacheProducts(List<ProductModel> products) =>
      storage.write(CACHED_PRODUCTS, productModelToJson(products));

  Future<List<ProductModel>> getLastListProducts() async {
    try {
      final list = await storage.read(CACHED_PRODUCTS);
      return Future.value(productModelFromJson(list));
    } catch (e) {
      throw CacheException();
    }
  }
}
