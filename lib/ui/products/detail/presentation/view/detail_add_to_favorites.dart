import 'package:app_catalogo/core/models/product_model.dart';
import 'package:app_catalogo/ui/app/bloc/app_bloc.dart';
import 'package:app_catalogo/ui/products/detail/presentation/bloc/detail_bloc.dart';
import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:app_catalogo/ui/shared/snack_bar/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailAddToFavorites extends StatelessWidget {
  const DetailAddToFavorites({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DetailBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${product.price}',
          style: CustomStyle.textH1.copyWith(fontSize: 27),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            customShowSnackBar(
              context,
              message: 'Guardado en Favoritos, redirigiendo...',
              onClose: () {
                bloc.add(DetailEventAddToFavorites(product));
                context
                    .read<AppBloc>()
                    .add(const AppPageChangedTo(page: AppPageStatus.favorites));
              },
            );
          },
          child: Container(
            width: 200,
            height: 60,
            decoration: BoxDecoration(
              color: CustomColor.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Add to Favorites',
                style: CustomStyle.textH4White,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
