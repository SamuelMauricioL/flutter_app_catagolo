import 'package:app_catalogo/core/error/exceptions.dart';
import 'package:app_catalogo/core/error/failures.dart';
import 'package:app_catalogo/core/models/product_model.dart';
import 'package:app_catalogo/core/network/network_checker.dart';
import 'package:app_catalogo/ui/products/data/datasource/products_local_data_source.dart';
import 'package:app_catalogo/ui/products/data/datasource/products_remote_data_source.dart';
import 'package:oxidized/oxidized.dart';

abstract class ProductsRepository {
  Future<Result<List<ProductModel>, Failure>> getProducts();
  Future<Result<List<ProductModel>, Failure>> getProductsByCategory(
    String category,
    int page,
  );
}

class ProductsRepositoryImpl implements ProductsRepository {
  ProductsRepositoryImpl({
    required this.localDatasource,
    required this.remoteDataSource,
    required this.networkChecker,
  });

  final ProductsLocalDataSource localDatasource;
  final ProductsRemoteDataSource remoteDataSource;
  final NetworkChecker networkChecker;

  @override
  Future<Result<List<ProductModel>, Failure>> getProducts() async {
    if (await networkChecker.isConnected) {
      try {
        final remote = await remoteDataSource.getProducts();
        localDatasource.cacheProducts(remote);
        return Result.ok(remote);
      } on ServerException {
        return Result.err(ServerFailure());
      }
    } else {
      try {
        final local = await localDatasource.getLastListProducts();
        return Result.ok(local);
      } on CacheException {
        return Result.err(CacheFailure());
      }
    }
  }

  @override
  Future<Result<List<ProductModel>, Failure>> getProductsByCategory(
    String category,
    int page,
  ) async {
    if (await networkChecker.isConnected) {
      try {
        final remote =
            await remoteDataSource.getProductsByCategory(category, page);
        localDatasource.cacheProducts(remote);
        return Result.ok(remote);
      } on ServerException {
        return Result.err(ServerFailure());
      }
    } else {
      return Result.ok(const []);
    }
  }
}
