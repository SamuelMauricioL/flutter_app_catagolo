import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/icons/search.svg',
          height: 40,
          width: 40,
        ),
        SvgPicture.asset(
          'assets/icons/notification.svg',
          height: 40,
          width: 40,
        ),
      ],
    );
  }
}
