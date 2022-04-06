import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/app/routes/app_routes.dart';
import 'package:app_catalogo/ui/favorites/presentation/view/favorites_page.dart';
import 'package:app_catalogo/ui/products/detail/presentation/view/detail_page.dart';
import 'package:app_catalogo/ui/products/presentation/view/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('onGenerateAppViewPages', () {
    test('returns [ProductsPage] when AppAuthenticated', () {
      expect(
        onGenerateAppViewPages(
          const AppState(
            // ignore: avoid_redundant_argument_values
            pageStatus: AppPageStatus.home,
          ),
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

    test('returns [FavoritesPage] when AppUnauthenticated', () {
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

    test('returns [DetailPage] when AppUnauthenticated', () {
      expect(
        onGenerateAppViewPages(
          const AppState(
            pageStatus: AppPageStatus.detail,
          ),
          [],
        ),
        [
          isA<MaterialPage>().having(
            (p) => p.child,
            'child',
            isA<DetailPage>(),
          )
        ],
      );
    });
  });
}
