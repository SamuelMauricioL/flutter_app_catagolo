import 'package:app_catalogo/core/error/exceptions.dart';
import 'package:app_catalogo/core/error/failures.dart';
import 'package:app_catalogo/core/models/product_model.dart';
import 'package:app_catalogo/ui/products/detail/data/datasource/detail_local_data_source.dart';
import 'package:oxidized/oxidized.dart';

// ignore: one_member_abstracts
abstract class DetailRepository {
  Future<Result<bool, Failure>> saveToFavorites(ProductModel product);
}

class DetailRepositoryImpl implements DetailRepository {
  DetailRepositoryImpl({
    required this.localDatasource,
  });

  final DetailLocalDataSource localDatasource;

  @override
  Future<Result<bool, Failure>> saveToFavorites(ProductModel product) async {
    try {
      final isSaved = await localDatasource.cacheFavorite(product);
      return Result.ok(isSaved);
    } on CacheException {
      return Result.err(CacheFailure());
    }
  }
}
