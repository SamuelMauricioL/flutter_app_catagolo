import 'package:app_catalogo/ui/favorites/presentation/routes/favorites_pages.dart';
import 'package:app_catalogo/ui/favorites/presentation/routes/favorites_routes.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

class FavoritesRouting extends StatelessWidget {
  const FavoritesRouting._();

  static Page<void> page() =>
      const MaterialPage<void>(child: FavoritesRouting._());

  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      state: FavoritesPages.favorites,
      observers: [HeroController()],
      onGeneratePages: onGenerateFavoritesPages,
    );
  }
}
