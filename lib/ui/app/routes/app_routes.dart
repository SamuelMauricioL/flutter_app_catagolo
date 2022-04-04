import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/favorites/presentation/view.dart';
import 'package:app_catalogo/ui/products/detail/presentation/view/view.dart';
import 'package:app_catalogo/ui/products/presentation/view/view.dart';
import 'package:flutter/material.dart';

List<Page> onGenerateAppViewPages(AppState state, List<Page> pages) {
  switch (state.pageStatus) {
    case AppPageStatus.home:
      return [
        ProductsPage.page(),
      ];
    case AppPageStatus.detail:
      return [
        DetailPage.page(),
      ];
    case AppPageStatus.favorites:
      return [
        FavoritesPage.page(),
      ];
    case AppPageStatus.profile:
      return [
        ProductsPage.page(),
      ];
  }
}
