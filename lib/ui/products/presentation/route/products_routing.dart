import 'package:app_catalogo/ui/products/presentation/route/products_pages.dart';
import 'package:app_catalogo/ui/products/presentation/route/products_routes.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

class ProductsRouting extends StatelessWidget {
  const ProductsRouting._();

  static Page<void> page() =>
      const MaterialPage<void>(child: ProductsRouting._());

  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      state: ProductsPages.products,
      observers: [HeroController()],
      onGeneratePages: onGenerateProductsPages,
    );
  }
}
