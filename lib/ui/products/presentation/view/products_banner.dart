import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsBanner extends StatefulWidget {
  const ProductsBanner({Key? key}) : super(key: key);

  @override
  State<ProductsBanner> createState() => _ProductsBannerState();
}

class _ProductsBannerState extends State<ProductsBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          margin: const EdgeInsets.only(top: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: CustomColor.primary,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 14,
              left: 14,
              right: 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Music and No more',
                  style: CustomStyle.textH1White,
                ),
                const SizedBox(height: 20),
                Text(
                  '10% off for One of the best\nheadphones in the world',
                  style: CustomStyle.textH7White,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: CustomStyle.buttonStyleWhite,
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 10),
                      Text('Order Now', style: CustomStyle.textH7),
                      const SizedBox(width: 4),
                      Container(
                        child: SvgPicture.asset(
                          'assets/icons/arrow_right.svg',
                          color: CustomColor.black,
                          height: 25,
                          width: 25,
                        ),
                      ),
                      const SizedBox(width: 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 14,
          bottom: 30,
          child: Image.asset(
            'assets/images/thumbnails_black.png',
            width: 120,
          ),
        ),
      ],
    );
  }
}
