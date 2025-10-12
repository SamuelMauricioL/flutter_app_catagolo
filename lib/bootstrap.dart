import 'dart:async';
import 'dart:developer';

import 'package:app_catalogo/core/network/network_checker.dart';
import 'package:app_catalogo/core/storage/storage.dart';
import 'package:app_catalogo/features/detail/data/datasource/detail_local_data_source.dart';
import 'package:app_catalogo/features/detail/data/repositories/detail_repository.dart';
import 'package:app_catalogo/features/favorites/data/datasource/favorites_local_data_source.dart';
import 'package:app_catalogo/features/favorites/data/repositories/favorites_repository.dart';
import 'package:app_catalogo/features/products/data/datasource/products_local_data_source.dart';
import 'package:app_catalogo/features/products/data/datasource/products_remote_data_source.dart';
import 'package:app_catalogo/features/products/data/repositories/products_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  try {
    // Asegurar que Flutter esté inicializado
    WidgetsFlutterBinding.ensureInitialized();

    // Configurar manejo de errores global
    FlutterError.onError = (details) {
      log(details.exceptionAsString(), stackTrace: details.stack);
    };

    // Configurar observer para los blocs
    Bloc.observer = const AppBlocObserver();

    // Inicializar servicios de la aplicación
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

    // RevenueCat se inicializará cuando el usuario inicie sesión
    log('RevenueCat se inicializará cuando el usuario inicie sesión');

    PaintingBinding.instance.imageCache.maximumSizeBytes = 400 * 1024 * 1024;

    // Iniciar la aplicación
    runApp(
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
    );
  } catch (error, stackTrace) {
    log('Error durante el bootstrap: $error', stackTrace: stackTrace);
    rethrow;
  }
}
