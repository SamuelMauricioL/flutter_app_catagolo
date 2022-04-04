import 'package:app_catalogo/core/error/exceptions.dart';
import 'package:app_catalogo/core/models/product_model.dart';
import 'package:app_catalogo/core/storage/storage.dart';

const CACHED_FAVORITES = 'CACHED_FAVORITES';

class DetailLocalDataSource {
  DetailLocalDataSource({required this.storage});

  final Storage storage;

  Future<bool> cacheFavorite(ProductModel product) async {
    try {
      final cachedFavorites = await storage.read(CACHED_FAVORITES);
      if (cachedFavorites == null) {
        await storage.write(CACHED_FAVORITES, productModelToJson([product]));
      } else {
        final favorites = productModelFromJson(cachedFavorites);
        if (favorites.where((p) => p.id == product.id).isEmpty) {
          favorites.add(product);
          await storage.write(CACHED_FAVORITES, productModelToJson(favorites));
        }
      }
      return true;
    } catch (e) {
      throw CacheException();
    }
  }
}
