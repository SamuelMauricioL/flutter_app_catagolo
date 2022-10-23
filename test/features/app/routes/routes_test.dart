import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/app/routes/app_routes.dart';
import 'package:app_catalogo/ui/favorites/presentation/routes/favorites_routing.dart';
import 'package:app_catalogo/ui/products/presentation/route/products_routing.dart';
import 'package:app_catalogo/ui/profile/presentation/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppPageStatus homePage;
  late AppPageStatus favoritesPage;
  late AppPageStatus profilePage;
  late AppState appState;

  setUp(() {
    homePage = AppPageStatus.home;
    favoritesPage = AppPageStatus.favorites;
    profilePage = AppPageStatus.profile;
    appState = const AppState();
  });

  group('onGenerateAppViewPages', () {
    test('returns [ProductsRouting] when AppPageStatus.home using copyWith',
        () {
      expect(
        onGenerateAppViewPages(appState.copyWith(pageStatus: homePage), []),
        [
          isA<MaterialPage>().having(
            (p) => p.child,
            'child',
            isA<ProductsRouting>(),
          )
        ],
      );
    });

    test('returns [ProductsRouting] when AppPageStatus.home', () {
      expect(
        onGenerateAppViewPages(appState, []),
        [
          isA<MaterialPage>().having(
            (p) => p.child,
            'child',
            isA<ProductsRouting>(),
          )
        ],
      );
    });

    test('returns [FavoritesRouting] when AppPageStatus.favorites', () {
      expect(
        onGenerateAppViewPages(
          appState.copyWith(pageStatus: favoritesPage),
          [],
        ),
        [
          isA<MaterialPage>().having(
            (p) => p.child,
            'child',
            isA<FavoritesRouting>(),
          )
        ],
      );
    });

    test('returns [ProfilePage] when AppPageStatus.profile', () {
      expect(
        onGenerateAppViewPages(appState.copyWith(pageStatus: profilePage), []),
        [
          isA<MaterialPage>().having(
            (p) => p.child,
            'child',
            isA<ProfilePage>(),
          )
        ],
      );
    });
  });
}
