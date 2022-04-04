import 'package:app_catalogo/ui/products/models/product_model.dart';
import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:flutter/material.dart';

class DetailAddToFavorites extends StatelessWidget {
  const DetailAddToFavorites({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
