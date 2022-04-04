import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:flutter/material.dart';

class CustomIconStar extends StatelessWidget {
  const CustomIconStar({Key? key, required this.rate}) : super(key: key);
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: CustomColor.gray),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 8,
          left: 5,
          top: 3,
          bottom: 4,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.star_rate_rounded,
              color: CustomColor.yellow,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                rate,
                style: CustomStyle.textH6Bold,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
