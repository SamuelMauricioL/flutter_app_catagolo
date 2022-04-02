import 'package:app_catalogo/ui/products/presentation/view/products_filter_item.dart';
import 'package:flutter/material.dart';

class ProductsFilterList extends StatelessWidget {
  const ProductsFilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (_, i) {
          // Thematic thematic = thematics[i];
          // bool isSelected =thematic.id == viewModel.thematicSelected;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: const ProductsItemFilter(),
            ),
          );
        },
      ),
    );
  }
}
