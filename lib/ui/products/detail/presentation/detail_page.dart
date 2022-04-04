import 'package:app_catalogo/ui/products/detail/presentation/detail_app_bar.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<ProductsBloc, ProductsState>(
            buildWhen: (previous, current) => current is ProductsLoaded,
            builder: (_, state) {
              if (state is ProductsLoaded && state.selectedProduct != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DetailAppBar(),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Image.network(
                        state.selectedProduct!.url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
