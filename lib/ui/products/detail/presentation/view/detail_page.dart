import 'package:app_catalogo/ui/products/detail/presentation/view/detail_add_to_favorites.dart';
import 'package:app_catalogo/ui/products/detail/presentation/view/detail_app_bar.dart';
import 'package:app_catalogo/ui/products/detail/presentation/view/detail_customize.dart';
import 'package:app_catalogo/ui/products/detail/presentation/view/detail_image.dart';
import 'package:app_catalogo/ui/products/detail/presentation/view/detail_info.dart';
import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage<void>(
      child: DetailPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<ProductsBloc, ProductsState>(
              buildWhen: (previous, current) => current is ProductsLoaded,
              builder: (_, state) {
                if (state is ProductsLoaded && state.selectedProduct != null) {
                  final product = state.selectedProduct!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DetailAppBar(),
                      const SizedBox(height: 20),
                      DetailImage(image: product.image),
                      const SizedBox(height: 20),
                      DetailInfo(
                        name: product.name,
                        rate: product.rate.toString(),
                        description: product.description,
                      ),
                      const SizedBox(height: 25),
                      const DetailCustomize(),
                      const SizedBox(height: 40),
                      DetailAddToFavorites(product: product),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
