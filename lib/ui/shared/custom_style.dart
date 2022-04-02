import 'package:app_catalogo/ui/shared/custom_color.dart';
import 'package:flutter/material.dart';

class CustomStyle {
  static TextStyle textH1 = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: CustomColor.black,
  );

  static TextStyle textH1White = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: CustomColor.white,
  );

  static TextStyle textH2 = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: CustomColor.black,
  );

  static TextStyle textH2White = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: CustomColor.white,
  );

  static TextStyle textH3 = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: CustomColor.black,
  );

  static TextStyle textH3Thin = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: CustomColor.black,
  );

  static TextStyle textH4 = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: CustomColor.black,
  );
  static TextStyle textH4White = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle textH5 = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: CustomColor.black,
  );

  static TextStyle textH6 = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 14,
    color: CustomColor.black,
  );

  static TextStyle textH6Gray = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 14,
    color: CustomColor.gray,
  );

  static TextStyle textH6Bold = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: CustomColor.black,
  );

  static TextStyle textH6Medium = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: CustomColor.black,
  );

  static TextStyle textH7 = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 13,
    color: CustomColor.black,
  );

  static TextStyle textH7White = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 13,
    color: CustomColor.white,
  );

  static TextStyle textH7Bold = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: CustomColor.black,
  );

  static TextStyle textH8 = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 12,
    color: CustomColor.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textH8Bold = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 12,
    color: CustomColor.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textH8BoldWhite = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 12,
    color: CustomColor.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textH8Gray = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 12,
    color: CustomColor.gray,
  );

  static TextStyle textH9MediumGray = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: CustomColor.mediumGray,
    height: 1.2,
  );

  static TextStyle textH9 = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 12,
    color: CustomColor.black,
    fontWeight: FontWeight.normal,
  );

  static TextStyle textH10 = const TextStyle(
    fontFamily: 'BwNista',
    fontSize: 10,
    color: CustomColor.black,
    fontWeight: FontWeight.normal,
  );

  static ButtonStyle buttonPrimarySmall = TextButton.styleFrom(
    primary: Colors.white,
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 11,
      fontFamily: 'BwNista',
    ),
    padding: const EdgeInsets.symmetric(horizontal: 8),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    backgroundColor: CustomColor.primary,
  );

  static ButtonStyle buttonFilter = TextButton.styleFrom(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: 'BwNista',
      height: 1.4,
    ),
    primary: CustomColor.primary,
    padding: const EdgeInsets.all(2),
    backgroundColor: CustomColor.primaryLight,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
  );

  static ButtonStyle buttonStyleActive = TextButton.styleFrom(
    textStyle: textH8,
    primary: Colors.white,
    padding: const EdgeInsets.all(2),
    backgroundColor: CustomColor.primary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
  );

  static ButtonStyle buttonStyleDeactive = TextButton.styleFrom(
    textStyle: textH8Gray,
    primary: Colors.white,
    padding: const EdgeInsets.all(2),
    backgroundColor: CustomColor.primaryLight,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
  );

  static ButtonStyle buttonStyleWhite = TextButton.styleFrom(
    textStyle: textH8,
    primary: CustomColor.black,
    padding: const EdgeInsets.all(2),
    backgroundColor: CustomColor.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
  );

  static BoxDecoration boxShadow = const BoxDecoration(
    color: CustomColor.primaryLight,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: CustomColor.shadowBlue,
        spreadRadius: 5,
        blurRadius: 50,
        offset: Offset(0, 8),
      ),
    ],
  );

  static BorderRadius borderRadius =
      const BorderRadius.all(Radius.circular(10));

  static BoxDecoration boxLightGreen = BoxDecoration(
    color: CustomColor.primaryLight,
    borderRadius: borderRadius,
  );

  static BoxDecoration boxGreen = BoxDecoration(
    color: CustomColor.primary,
    borderRadius: borderRadius,
  );

  static BoxDecoration boxRed = BoxDecoration(
    color: CustomColor.red,
    borderRadius: borderRadius,
  );

  static BoxDecoration borderBottom = const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        width: 1.1,
        color: CustomColor.primaryLight,
      ),
    ),
  );
}
