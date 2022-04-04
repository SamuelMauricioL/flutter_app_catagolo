import 'package:app_catalogo/ui/products/presentation/bloc/products_bloc.dart';
import 'package:app_catalogo/ui/shared/search/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductsBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SearchField(
            onChanged: (keyword) =>
                bloc.add(ProductEventSearchProduct(keyword)),
          ),
        ),
        const SizedBox(width: 17),
        SvgPicture.asset(
          'assets/icons/notification.svg',
          height: 40,
          width: 40,
        ),
      ],
    );
  }
}
