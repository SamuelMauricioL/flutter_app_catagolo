import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.onChanged,
    this.onTap,
    this.hintText = 'Buscar...',
    this.onSubmitted,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
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
              // borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CustomColor.white),
              // borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            prefixIcon:
                const Icon(Icons.search, size: 25, color: Colors.black45),
            // suffixIcon: InkWell(
            //   onTap: () {},
            //   child: Container(
            //     padding: EdgeInsets.all(defaultPadding * 0.75),
            //     margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            //     decoration: BoxDecoration(
            //       color: kblue,
            //       borderRadius: const BorderRadius.all(Radius.circular(10)),
            //     ),
            //     child: SvgPicture.asset("assets/icons/Search.svg"),
            //   ),
            // ),
          ),
          onTap: onTap,
          onFieldSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
