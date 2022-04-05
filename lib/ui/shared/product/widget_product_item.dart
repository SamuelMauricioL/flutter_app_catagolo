import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:flutter/material.dart';

class WidgetProductItem extends StatelessWidget {
  const WidgetProductItem({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);
  final String image;
  final String title;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      color: CustomColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CustomStyle.textH5,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: CustomStyle.textH8.copyWith(color: CustomColor.gray),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$$price',
                        style: CustomStyle.textH4.copyWith(
                          color: CustomColor.primary,
                        ),
                      ),
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
                              'Buy',
                              style: CustomStyle.textH8Bold
                                  .copyWith(color: CustomColor.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
