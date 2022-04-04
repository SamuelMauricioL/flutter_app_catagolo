import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/products/models/product_model.dart';
import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:app_catalogo/ui/shared/loading/custom_loading.dart';
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
              category: state.category,
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
              onTap: () => context
                  .read<AppBloc>()
                  .add(const AppPageChangedTo(page: AppPageStatus.detail)),
              child: Card(
                elevation: 2,
                margin: EdgeInsets.zero,
                color: CustomColor.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.network(
                        widget.products[i].image,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.products[i].name,
                              style: CustomStyle.textH5,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              widget.products[i].description,
                              style: CustomStyle.textH8
                                  .copyWith(color: CustomColor.gray),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${widget.products[i].price}',
                                  style: CustomStyle.textH4.copyWith(
                                    color: CustomColor.primary,
                                  ),
                                ),
                                Card(
                                  elevation: 0,
                                  margin: EdgeInsets.zero,
                                  color: CustomColor.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 7,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Buy',
                                        style: CustomStyle.textH8Bold
                                            .copyWith(color: CustomColor.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
