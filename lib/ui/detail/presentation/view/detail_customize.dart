import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailCustomize extends StatelessWidget {
  const DetailCustomize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
