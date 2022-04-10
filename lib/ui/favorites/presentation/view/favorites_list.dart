import 'package:app_catalogo/core/models/product_model.dart';
import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:app_catalogo/ui/shared/loading/custom_loading.dart';
import 'package:app_catalogo/ui/shared/product/widget_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (_, state) {
          if (state is FavoritesLoaded) {
            return FavoritesListBody(
              products: state.products,
            );
          }
          if (state is FavoritesError) {
            return Text(state.message);
          }
          return const CustomLoading();
        },
      ),
    );
  }
}

class FavoritesListBody extends StatelessWidget {
  const FavoritesListBody({Key? key, required this.products}) : super(key: key);
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final productsBloc = context.read<ProductsBloc>();
    final favoritesBloc = context.read<FavoritesBloc>();
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (_, i) {
        return Dismissible(
          key: Key(products[i].id.toString()),
          onDismissed: (direction) {
            final event = FavoritesEventProductRemoved(product: products[i]);
            favoritesBloc.add(event);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                productsBloc.add(ProductEventSelectProduct(products[i]));
                context
                    .read<AppBloc>()
                    .add(const AppPageChangedTo(page: AppPageStatus.detail));
              },
              child: WidgetProductItem(
                image: products[i].image,
                title: products[i].title,
                description: products[i].description,
                price: products[i].price.toString(),
              ),
            ),
          ),
        );
      },
    );
  }
}
