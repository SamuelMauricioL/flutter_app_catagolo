import 'package:app_catalogo/ui/products/presentation/route/products_pages.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.flow<ProductsPages>().update((_) => ProductsPages.products);
        return false;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context
                .flow<ProductsPages>()
                .update((_) => ProductsPages.products),
            child: SvgPicture.asset(
              'assets/icons/arrow_left.svg',
              height: 40,
              width: 40,
            ),
          ),
          const SizedBox(width: 17),
          SvgPicture.asset(
            'assets/icons/notification.svg',
            height: 40,
            width: 40,
          ),
        ],
      ),
    );
  }
}
