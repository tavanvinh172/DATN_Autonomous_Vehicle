import 'package:automotive_project/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum MyThemeKeys { blue, dark, gold, green, darkCyan, midnight }

class MyThemes {
  static final TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.roboto(
            fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5)
        .copyWith(color: AppColors.colorDark),
    displayMedium: GoogleFonts.roboto(
            fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5)
        .copyWith(color: AppColors.colorDark),
    displaySmall: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400)
        .copyWith(color: AppColors.colorDark),
    headlineMedium: GoogleFonts.roboto(
            fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25)
        .copyWith(color: AppColors.colorDark),
    headlineSmall: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400)
        .copyWith(color: AppColors.colorDark),
    titleLarge: GoogleFonts.roboto(
            fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15)
        .copyWith(color: AppColors.colorDark),
    titleMedium: GoogleFonts.roboto(
            fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15)
        .copyWith(color: AppColors.colorDark),
    titleSmall: GoogleFonts.roboto(
            fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1)
        .copyWith(color: AppColors.colorDark),
    bodyLarge: GoogleFonts.roboto(
            fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5)
        .copyWith(color: AppColors.colorDark),
    bodyMedium: GoogleFonts.roboto(
            fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25)
        .copyWith(color: AppColors.colorDark),
    labelLarge: GoogleFonts.roboto(
            fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25)
        .copyWith(color: AppColors.colorDark),
    bodySmall: GoogleFonts.roboto(
            fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4)
        .copyWith(color: AppColors.colorDark),
    labelSmall: GoogleFonts.roboto(
            fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5)
        .copyWith(color: AppColors.colorDark),
  );

  static final ThemeData blueTheme = ThemeData(
      primaryColor: AppColors.colorPrimary,
      brightness: Brightness.light,
      textTheme: TextTheme(
          titleLarge: GoogleFonts.roboto(
            textStyle: const TextStyle(
                fontSize: 20.0,
                color: AppColors.colorWhite,
                fontWeight: FontWeight.w700),
          ),
          titleMedium: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 16.0,
              color: AppColors.colorWhite,
            ),
          ),
          bodyLarge: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: AppColors.colorWhite,
            ),
          ),
          bodyMedium: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 16.0,
              color: AppColors.colorWhite,
            ),
          ),
          bodySmall: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 12.0,
              color: AppColors.colorWhite,
            ),
          ),
          labelLarge: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 20.0,
              color: AppColors.colorWhite,
            ),
          ),
          labelMedium: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 16.0,
              color: AppColors.colorWhite,
            ),
          ))
      // textTheme: const CupertinoTextThemeData(
      //   dateTimePickerTextStyle: TextStyle(fontSize: 18),
      // ),
      );
}
