import 'package:app_catalogo/ui/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:app_catalogo/ui/favorites/presentation/view/favorites_list.dart';
import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage<void>(
      child: FavoritesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesBloc>.value(
      value: BlocProvider.of<FavoritesBloc>(context)
        ..add(
          FavoritesEventListCalled(),
        ),
      child: const FavoritesPageBody(),
    );
  }
}

class FavoritesPageBody extends StatelessWidget {
  const FavoritesPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Favorites',
                  style: CustomStyle.textH3,
                ),
              ),
              const SizedBox(height: 15),
              const FavoritesList(),
            ],
          ),
        ),
      ),
    );
  }
}
