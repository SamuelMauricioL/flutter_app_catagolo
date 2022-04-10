import 'package:app_catalogo/ui/shared/loading/custom_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  const CustomCacheNetworkImage({
    Key? key,
    required this.image,
    this.width,
    this.height,
  }) : super(key: key);
  final String image;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      width: width,
      height: height,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CustomLoading(
        value: downloadProgress.progress,
      ),
      errorWidget: (context, url, dynamic error) => const Icon(Icons.error),
    );
  }
}
