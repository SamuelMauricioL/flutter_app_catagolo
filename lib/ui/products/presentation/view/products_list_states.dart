import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:app_catalogo/ui/shared/loading/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListState extends StatelessWidget {
  const ProductListState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      buildWhen: (previous, current) => current is ProductsLoaded,
      builder: (_, state) {
        if (state is ProductsLoaded && state.isLoadingMore) {
          return const CustomLoading();
        }
        if (state is ProductsLoaded && !state.hasNextPage) {
          return Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            color: CustomColor.secondary,
            child: const Center(
              child: Text('You have fetched all of the content'),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
