import 'package:app_catalogo/core/shared/custom_color.dart';
import 'package:app_catalogo/core/shared/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  static ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle:
          SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
      titleTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: CustomColor.black,
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      shape: const Border(
        bottom: BorderSide(
          color: CustomColor.primaryLight,
          width: 1.1,
        ),
      ),
      iconTheme: const IconThemeData(
        color: CustomColor.black,
      ),
    ),
    fontFamily: 'BwNista',
    scaffoldBackgroundColor: Colors.white,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: CustomColor.black,
        textStyle: CustomStyle.textH6Medium,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        side: const BorderSide(color: CustomColor.black),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        // primary: Colors.white,
        foregroundColor: WidgetStateColor.resolveWith((states) => Colors.white),
        textStyle: WidgetStateProperty.resolveWith<TextStyle?>(
            (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return CustomStyle.textH6Medium;
          }
          return CustomStyle.textH6Medium;
        }),
        overlayColor: WidgetStateColor.resolveWith(
          (states) => Colors.white.withValues(alpha: .12),
        ),
        minimumSize:
            WidgetStateProperty.resolveWith<Size?>((Set<WidgetState> states) {
          return const Size(double.infinity, 50);
        }),
        padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry?>(
            (Set<WidgetState> states) {
          return const EdgeInsets.symmetric(horizontal: 16);
        }),
        shape: WidgetStateProperty.resolveWith<OutlinedBorder?>(
            (Set<WidgetState> states) {
          return const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          );
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return CustomColor.gray;
            }
            return CustomColor.primary;
          },
        ),
      ),
    ),
    textTheme: TextTheme(bodyMedium: CustomStyle.textH6Medium),
  );
}
