import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/app/routes/app_routes.dart';
import 'package:app_catalogo/ui/favorites/presentation/view/favorites_page.dart';
import 'package:app_catalogo/ui/products/presentation/view/products_page.dart';
import 'package:app_catalogo/ui/profile/presentation/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const page = AppPageStatus.home;

  group('onGenerateAppViewPages', () {
    test('returns [ProductsPage] when AppPageStatus.home using copyWith', () {
      expect(
        onGenerateAppViewPages(
          const AppState().copyWith(pageStatus: page),
          [],
        ),
        [
          isA<MaterialPage>().having(
            (p) => p.child,
            'child',
            isA<ProductsPage>(),
          )
        ],
      );
    });

    test('returns [ProductsPage] when AppPageStatus.home', () {
      expect(
        onGenerateAppViewPages(
          const AppState(),
          [],
        ),
        [
          isA<MaterialPage>().having(
            (p) => p.child,
            'child',
            isA<ProductsPage>(),
          )
        ],
      );
    });

    test('returns [FavoritesPage] when AppPageStatus.favorites', () {
      expect(
        onGenerateAppViewPages(
          const AppState(
            pageStatus: AppPageStatus.favorites,
          ),
          [],
        ),
        [
          isA<MaterialPage>().having(
            (p) => p.child,
            'child',
            isA<FavoritesPage>(),
          )
        ],
      );
    });

    test('returns [ProfilePage] when AppPageStatus.profile', () {
      expect(
        onGenerateAppViewPages(
          const AppState(
            pageStatus: AppPageStatus.profile,
          ),
          [],
        ),
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
