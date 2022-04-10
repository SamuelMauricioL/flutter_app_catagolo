import 'package:app_catalogo/core/error/exceptions.dart';
import 'package:app_catalogo/core/models/product_model.dart';
import 'package:app_catalogo/core/storage/storage.dart';

const CACHED_FAVORITES = 'CACHED_FAVORITES';

class FavoritesLocalDataSource {
  FavoritesLocalDataSource({required this.storage});

  final Storage storage;

  Future<List<ProductModel>> getFavorites() async {
    try {
      final list = await storage.read(CACHED_FAVORITES);
      return Future.value(productModelFromJson(list!));
    } catch (e) {
      throw CacheException();
    }
  }

  Future<List<ProductModel>> removeFavorite(ProductModel product) async {
    try {
      final list = await storage.read(CACHED_FAVORITES);
      final products = productModelFromJson(list!);
      products.removeWhere((p) => p.id == product.id);
      await storage.write(CACHED_FAVORITES, productModelToJson(products));
      return Future.value(products);
    } catch (e) {
      throw CacheException();
    }
  }
}
