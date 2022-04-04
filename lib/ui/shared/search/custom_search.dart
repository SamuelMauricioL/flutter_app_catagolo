import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.onChanged,
    this.hintText = 'Buscar...',
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      color: Colors.transparent,
      shadowColor: Colors.grey[50],
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextFormField(
          onChanged: onChanged,
          cursorHeight: 15,
          style: const TextStyle(
            fontSize: 15,
          ),
          decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.zero,
            hintText: hintText,
            fillColor: CustomColor.white,
            hintTextDirection: TextDirection.ltr,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CustomColor.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CustomColor.white),
            ),
            prefixIcon:
                const Icon(Icons.search, size: 25, color: Colors.black45),
          ),
        ),
      ),
    );
  }
}
