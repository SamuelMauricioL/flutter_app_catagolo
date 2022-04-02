// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:app_catalogo/core/network/network_checker.dart';
import 'package:app_catalogo/core/storage/storage.dart';
import 'package:app_catalogo/ui/products/data/datasource/products_local_data_source.dart';
import 'package:app_catalogo/ui/products/data/datasource/products_remote_data_source.dart';
import 'package:app_catalogo/ui/products/data/repositories/products_repository.dart';
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
      final networkChecker = NetworkCheckerImpl();

      // Products
      final productsLocalDS = ProductsLocalDataSource(storage: storage);
      final productsRemoteDS = ProductsRemoteDataSource();

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
