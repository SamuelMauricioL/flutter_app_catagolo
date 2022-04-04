import 'package:app_catalogo/core/error/exceptions.dart';
import 'package:app_catalogo/core/models/product_model.dart';
import 'package:app_catalogo/core/storage/storage.dart';

const CACHED_FAVORITES = 'CACHED_FAVORITES';

class ProductsLocalDataSource {
  ProductsLocalDataSource({required this.storage});

  final Storage storage;

  Future<void> cacheFavorite(ProductModel product) async {
    try {
      final list = await storage.read(CACHED_FAVORITES);
      final products = productModelFromJson(list);
      products.add(product);
      await storage.write(CACHED_FAVORITES, productModelToJson(products));
    } catch (e) {
      throw CacheException();
    }
  }
}
