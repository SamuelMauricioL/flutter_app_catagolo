import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:flutter/material.dart';

class ProductsItemFilter extends StatelessWidget {
  const ProductsItemFilter({Key? key, required this.title}) : super(key: key);
  final String title;

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
                title,
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
