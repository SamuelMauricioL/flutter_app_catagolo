import 'dart:async';
import 'dart:developer';

import 'package:app_catalogo/core/network/network_checker.dart';
import 'package:app_catalogo/core/storage/storage.dart';
import 'package:app_catalogo/ui/detail/data/datasource/detail_local_data_source.dart';
import 'package:app_catalogo/ui/detail/data/repositories/detail_repository.dart';
import 'package:app_catalogo/ui/favorites/data/datasource/favorites_local_data_source.dart';
import 'package:app_catalogo/ui/favorites/data/repositories/favorites_repository.dart';
import 'package:app_catalogo/ui/products/data/datasource/products_local_data_source.dart';
import 'package:app_catalogo/ui/products/data/datasource/products_remote_data_source.dart';
import 'package:app_catalogo/ui/products/data/repositories/products_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      final storage = Storage();
      await storage.init();

      // Network checker
      final conectivity = Connectivity();
      final networkChecker = NetworkCheckerImpl(conectivity);

      // Products
      final productsLocalDS = ProductsLocalDataSource(storage: storage);
      final productsRemoteDS = ProductsRemoteDataSource();

      //Detail
      final detailLocalDS = DetailLocalDataSource(storage: storage);

      // Favorites
      final favoritesLocalDS = FavoritesLocalDataSource(storage: storage);

      await BlocOverrides.runZoned(
        () async => runApp(
          MultiRepositoryProvider(
            providers: [
              RepositoryProvider<ProductsRepositoryImpl>(
                create: (_) => ProductsRepositoryImpl(
                  localDatasource: productsLocalDS,
                  remoteDataSource: productsRemoteDS,
                  networkChecker: networkChecker,
                ),
              ),
              RepositoryProvider<DetailRepositoryImpl>(
                create: (_) => DetailRepositoryImpl(
                  localDatasource: detailLocalDS,
                ),
              ),
              RepositoryProvider<FavoritesRepositoryImpl>(
                create: (_) => FavoritesRepositoryImpl(
                  localDatasource: favoritesLocalDS,
                ),
              ),
            ],
            child: await builder(),
          ),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
