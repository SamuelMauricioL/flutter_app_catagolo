import 'package:app_catalogo/core/models/product_model.dart';
import 'package:app_catalogo/ui/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:app_catalogo/ui/favorites/presentation/routes/favorites_pages.dart';
import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:app_catalogo/ui/shared/loading/custom_loading.dart';
import 'package:app_catalogo/ui/shared/product/widget_product_item.dart';
import 'package:app_catalogo/ui/shared/snack_bar/custom_snack_bar.dart';
import 'package:flow_builder/flow_builder.dart';
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
          background: Container(color: CustomColor.secondary),
          onDismissed: (direction) {
            final event = FavoritesEventProductRemoved(product: products[i]);
            favoritesBloc.add(event);
            customShowSnackBar(context, message: 'Product dismissed');
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                productsBloc.add(ProductEventSelectProduct(products[i]));
                context
                    .flow<FavoritesPages>()
                    .update((_) => FavoritesPages.detail);
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
