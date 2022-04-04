import 'package:app_catalogo/ui/products/detail/presentation/view/detail_app_bar.dart';
import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:app_catalogo/ui/shared/icons/custom_icon_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                      Center(
                        child: SizedBox(
                          height: 250,
                          child: Image.network(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product.name,
                              style: CustomStyle.textH1,
                            ),
                          ),
                          const SizedBox(width: 10),
                          CustomIconStar(rate: product.rate.toString()),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(product.description),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/specifications.svg',
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            'Product Specifications',
                            style: CustomStyle.textH4,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/colors.svg',
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            'Colors',
                            style: CustomStyle.textH4,
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${product.price}',
                            style: CustomStyle.textH1.copyWith(fontSize: 27),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 200,
                            height: 60,
                            decoration: BoxDecoration(
                              color: CustomColor.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Add to Favorites',
                                style: CustomStyle.textH4White,
                              ),
                            ),
                          ),
                        ],
                      ),
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
