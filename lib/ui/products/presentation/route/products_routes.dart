import 'package:app_catalogo/ui/detail/presentation/view/view.dart';
import 'package:app_catalogo/ui/products/presentation/route/products_pages.dart';
import 'package:app_catalogo/ui/products/presentation/view/products_page.dart';
import 'package:flutter/widgets.dart';

List<Page<dynamic>> onGenerateProductsPages(
  ProductsPages state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case ProductsPages.other:
      return [
        ProductsPage.page(),
        DetailPage.page(),
      ];
    case ProductsPages.detail:
      return [
        ProductsPage.page(),
        DetailPage.page(),
      ];
    case ProductsPages.products:
      return [ProductsPage.page()];
  }
}
