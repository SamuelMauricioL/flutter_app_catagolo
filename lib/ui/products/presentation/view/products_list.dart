import 'package:app_catalogo/core/models/product_model.dart';
import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:app_catalogo/ui/shared/loading/custom_loading.dart';
import 'package:app_catalogo/ui/shared/product/widget_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (_, state) {
          if (state is ProductsLoaded) {
            return ProductsListBody(
              products: state.products,
              category: state.categorySelected,
              productsBloc: context.read<ProductsBloc>(),
            );
          }
          if (state is ProductsError) {
            return Text(state.message);
          }
          return const CustomLoading();
        },
      ),
    );
  }
}

class ProductsListBody extends StatefulWidget {
  const ProductsListBody({
    Key? key,
    required this.products,
    required this.productsBloc,
    required this.category,
  }) : super(key: key);

  final List<ProductModel> products;
  final ProductsBloc productsBloc;
  final String category;

  @override
  State<ProductsListBody> createState() => _ProductsListBodyState();
}

class _ProductsListBodyState extends State<ProductsListBody> {
  late ScrollController _controller;
  String message = '';

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      widget.productsBloc.add(
        ProductEventListByCategoryCalled(
          category: widget.category,
        ),
      );
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollStartNotification) {
          widget.productsBloc.add(ProductEventDisableBottomBanner());
        }
        return true;
      },
      child: ListView.builder(
        controller: _controller,
        itemCount: widget.products.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                widget.productsBloc
                    .add(ProductEventSelectProduct(widget.products[i]));
                context
                    .read<AppBloc>()
                    .add(const AppPageChangedTo(page: AppPageStatus.detail));
              },
              child: WidgetProductItem(
                image: widget.products[i].image,
                title: widget.products[i].title,
                description: widget.products[i].description,
                price: widget.products[i].price.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
