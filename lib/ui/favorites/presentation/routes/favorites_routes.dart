import 'package:app_catalogo/ui/detail/presentation/view/view.dart';
import 'package:app_catalogo/ui/favorites/presentation/routes/favorites_pages.dart';
import 'package:app_catalogo/ui/favorites/presentation/view/favorites_page.dart';
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
