import 'package:app_catalogo/features/app/bloc/app_bloc.dart';
import 'package:app_catalogo/features/favorites/presentation/routes/favorites_routing.dart';
import 'package:app_catalogo/features/products/presentation/route/products_routing.dart';
import 'package:app_catalogo/features/profile/presentation/view/view.dart';
import 'package:flutter/material.dart';

List<Page> onGenerateAppViewPages(AppState state, List<Page> pages) {
  switch (state.pageStatus) {
    case AppPageStatus.home:
      return [
        ProductsRouting.page(),
      ];
    case AppPageStatus.favorites:
      return [
        FavoritesRouting.page(),
      ];
    case AppPageStatus.profile:
      return [
        ProfilePage.page(),
      ];
  }
}
