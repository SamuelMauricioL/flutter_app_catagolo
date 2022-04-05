import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:app_catalogo/ui/shared/custom_style.dart';
import 'package:flutter/material.dart';

void customShowSnackBar(
  BuildContext context, {
  required String message,
  Function? onClose,
}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: CustomStyle.textH6Bold,
          ),
          backgroundColor: CustomColor.yellow,
          duration: const Duration(milliseconds: 1400),
          action: SnackBarAction(
            label: 'Ir',
            onPressed: () {},
          ),
          dismissDirection: DismissDirection.horizontal,
        ),
      )
      .closed
      .then((value) {
    onClose?.call();
  });
}
