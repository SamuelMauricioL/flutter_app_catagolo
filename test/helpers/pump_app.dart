// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:app_catalogo/core/network/network_checker.dart';
import 'package:app_catalogo/core/storage/storage.dart';
import 'package:app_catalogo/l10n/l10n.dart';
import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/detail/data/datasource/detail_local_data_source.dart';
import 'package:app_catalogo/ui/detail/data/repositories/detail_repository.dart';
import 'package:app_catalogo/ui/detail/presentation/bloc/detail_bloc.dart';
import 'package:app_catalogo/ui/favorites/data/datasource/favorites_local_data_source.dart';
import 'package:app_catalogo/ui/favorites/data/repositories/favorites_repository.dart';
import 'package:app_catalogo/ui/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:app_catalogo/ui/products/data/datasource/products_local_data_source.dart';
import 'package:app_catalogo/ui/products/data/datasource/products_remote_data_source.dart';
import 'package:app_catalogo/ui/products/data/repositories/products_repository.dart';
import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    AppBloc? appBloc,
  }) async {
    final storage = Storage();

    // Network checker
    final networkChecker = NetworkCheckerImpl();

    // Products
    final productsLocalDS = ProductsLocalDataSource(storage: storage);
    final productsRemoteDS = ProductsRemoteDataSource();

    //Detail
    final detailLocalDS = DetailLocalDataSource(storage: storage);

    // Favorites
    final favoritesLocalDS = FavoritesLocalDataSource(storage: storage);

    return pumpWidget(
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
        child: Builder(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(value: appBloc ?? MockAppBloc()),
                BlocProvider(
                  create: (_) => ProductsBloc(
                    repository: context.read<ProductsRepositoryImpl>(),
                  ),
                ),
                BlocProvider(
                  create: (_) => DetailBloc(
                    repository: context.read<DetailRepositoryImpl>(),
                  ),
                ),
                BlocProvider(
                  create: (_) => FavoritesBloc(
                    repository: context.read<FavoritesRepositoryImpl>(),
                  ),
                ),
              ],
              child: MaterialApp(
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                home: Material(
                  child: widget,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> pumpApp2(
    Widget widget, {
    AppBloc? appBloc,
  }) async {
    final storage = Storage();

    // Network checker
    final networkChecker = NetworkCheckerImpl();

    // Products
    final productsLocalDS = ProductsLocalDataSource(storage: storage);
    final productsRemoteDS = ProductsRemoteDataSource();

    //Detail
    final detailLocalDS = DetailLocalDataSource(storage: storage);

    // Favorites
    final favoritesLocalDS = FavoritesLocalDataSource(storage: storage);

    return pumpWidget(
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
        child: Builder(
          builder: (context) {
            return MaterialApp(
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              home: Material(
                child: widget,
              ),
            );
          },
        ),
      ),
    );
  }
}
