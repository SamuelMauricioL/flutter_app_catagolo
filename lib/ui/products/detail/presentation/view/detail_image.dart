import 'package:app_catalogo/ui/shared/cache_image/custom_cache_network_image.dart';
import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 250,
        child: CustomCacheNetworkImage(image: image),
      ),
    );
  }
}
