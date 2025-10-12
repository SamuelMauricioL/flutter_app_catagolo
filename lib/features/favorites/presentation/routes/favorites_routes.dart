import 'package:app_catalogo/features/detail/presentation/view/view.dart';
import 'package:app_catalogo/features/favorites/presentation/routes/favorites_pages.dart';
import 'package:app_catalogo/features/favorites/presentation/view/favorites_page.dart';
import 'package:flutter/widgets.dart';

List<Page<dynamic>> onGenerateFavoritesPages(
  FavoritesPages state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case FavoritesPages.detail:
      return [
        FavoritesPage.page(),
        DetailPage.page(),
      ];
    case FavoritesPages.favorites:
      return [FavoritesPage.page()];
  }
}
