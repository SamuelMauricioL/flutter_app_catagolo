import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:app_catalogo/ui/shared/icons/custom_icon_star.dart';
import 'package:flutter/material.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({
    Key? key,
    required this.name,
    required this.rate,
    required this.description,
  }) : super(key: key);
  final String name;
  final String rate;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: CustomStyle.textH1,
              ),
            ),
            const SizedBox(width: 10),
            CustomIconStar(rate: rate),
          ],
        ),
        const SizedBox(height: 15),
        Text(description),
      ],
    );
  }
}
