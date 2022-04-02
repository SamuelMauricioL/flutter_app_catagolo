import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:flutter/material.dart';

class ProductsItemFilter extends StatelessWidget {
  const ProductsItemFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
                'Headphone',
                style:
                    CustomStyle.textH8Bold.copyWith(color: CustomColor.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
