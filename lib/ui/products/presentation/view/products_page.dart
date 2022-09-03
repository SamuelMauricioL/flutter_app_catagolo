import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:app_catalogo/ui/products/presentation/route/products_pages.dart';
import 'package:app_catalogo/ui/products/presentation/route/products_routes.dart';
import 'package:app_catalogo/ui/products/presentation/view/producst_filter_list.dart';
import 'package:app_catalogo/ui/products/presentation/view/products_app_bar.dart';
import 'package:app_catalogo/ui/products/presentation/view/products_banner.dart';
import 'package:app_catalogo/ui/products/presentation/view/products_list.dart';
import 'package:app_catalogo/ui/products/presentation/view/products_list_states.dart';
import 'package:app_catalogo/ui/shared/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class ProductsPage extends StatelessWidget {
  const ProductsPage._();

  static Page<void> page() => const MaterialPage<void>(child: ProductsPage._());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>.value(
      value: BlocProvider.of<ProductsBloc>(context)
        ..add(
          ProductEventListCalled(),
        ),
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
              const ProductsCategoryList(),
              const SizedBox(height: 10),
              const ProductsList(),
              const ProductListState()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(appBloc: context.read<AppBloc>()),
    );
  }
}
