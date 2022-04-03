import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:app_catalogo/ui/products/presentation/view/products_filter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsFilterList extends StatelessWidget {
  const ProductsFilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductsBloc>();
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: BlocBuilder<ProductsBloc, ProductsState>(
        buildWhen: (previous, current) {
          if (previous is ProductsLoaded) {
            return previous.categories != bloc.productsLoaded.categories;
          }
          return true;
        },
        builder: (_, state) {
          if (state is ProductsLoaded) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () => bloc.add(
                      ProductEventListByCategoryCalled(
                        category: state.categories[i],
                      ),
                    ),
                    child: ProductsItemFilter(title: state.categories[i]),
                  ),
                );
              },
            );
          }
          if (state is ProductsError) {
            return Text(state.message);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
