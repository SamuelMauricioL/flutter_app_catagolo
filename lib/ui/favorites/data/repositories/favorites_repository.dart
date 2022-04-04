// ignore: one_member_abstracts
import 'package:app_catalogo/core/error/exceptions.dart';
import 'package:app_catalogo/core/error/failures.dart';
import 'package:app_catalogo/core/models/product_model.dart';
import 'package:app_catalogo/ui/favorites/data/datasource/favorites_local_data_source.dart';
import 'package:oxidized/oxidized.dart';

// ignore: one_member_abstracts
abstract class FavoritesRepository {
  Future<Result<List<ProductModel>, Failure>> getFavorites();
}

class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesRepositoryImpl({
    required this.localDatasource,
  });

  final FavoritesLocalDataSource localDatasource;

  @override
  Future<Result<List<ProductModel>, Failure>> getFavorites() async {
    try {
      final result = await localDatasource.getFavorites();
      return Result.ok(result);
    } on CacheException {
      return Result.err(CacheFailure());
    }
  }
}
