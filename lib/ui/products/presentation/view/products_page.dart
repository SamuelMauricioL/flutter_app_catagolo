import 'package:app_catalogo/ui/products/data/repositories/products_repository.dart';
import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:app_catalogo/ui/products/presentation/view/producst_filter_list.dart';
import 'package:app_catalogo/ui/products/presentation/view/products_app_bar.dart';
import 'package:app_catalogo/ui/products/presentation/view/products_banner.dart';
import 'package:app_catalogo/ui/products/presentation/view/products_list.dart';
import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:app_catalogo/ui/shared/loading/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  static Page page() {
    return const MaterialPage<void>(
      child: ProductsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsBloc(
        repository: context.read<ProductsRepositoryImpl>(),
      )..add(ProductEventListCalled()),
      child: const ProductsView(),
    );
  }
}

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductsAppBar(),
              const ProductsBanner(),
              const SizedBox(height: 20),
              Text('Popular Category', style: CustomStyle.textH1),
              const SizedBox(height: 20),
              const ProductsFilterList(),
              const SizedBox(height: 10),
              const ProductsList(),
              BlocBuilder<ProductsBloc, ProductsState>(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
