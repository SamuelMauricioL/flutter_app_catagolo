import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key, this.value}) : super(key: key);
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Center(
        child: CircularProgressIndicator(
          value: value,
          color: CustomColor.primary,
        ),
      ),
    );
  }
}
