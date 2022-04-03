import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:app_catalogo/ui/products/presentation/view/products_filter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsFilterList extends StatelessWidget {
  const ProductsFilterList({
    Key? key,
    required this.category,
    required this.categories,
  }) : super(key: key);
  final String category;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductsBloc>();
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: BlocSelector<ProductsBloc, ProductsState, bool>(
        selector: (state) {
          if (state is ProductsLoaded) {
            return state.category == category;
          }
          return false;
        },
        builder: (_, state) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () => bloc.add(
                    ProductEventListByCategoryCalled(
                      category: categories[i],
                    ),
                  ),
                  child: ProductsItemFilter(
                    title: categories[i],
                    isSelected: category == categories[i],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
