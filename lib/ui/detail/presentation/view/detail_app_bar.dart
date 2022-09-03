import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
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
    );
  }
}
