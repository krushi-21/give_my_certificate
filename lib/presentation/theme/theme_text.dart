import 'package:flutter/material.dart';
import 'package:give_my_certificate/common/constants/size_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import '/common/extensions/size_extensions.dart';
import 'theme_colors.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _chakraTextTheme => GoogleFonts.arimoTextTheme();

  static TextStyle? get _whiteHeadline6 => _chakraTextTheme.headline6?.copyWith(
      fontSize: Sizes.dimen_36.sp,
      fontWeight: FontWeight.w900,
      color: AppColor.lapisLazuli,
      letterSpacing: 0.4);
  static TextStyle? get _whiteHeadline5 => _chakraTextTheme.headline5?.copyWith(
      fontSize: Sizes.dimen_20.sp,
      fontWeight: FontWeight.w900,
      color: AppColor.brightGray,
      letterSpacing: 0.4);

  static getTextTheme() => TextTheme(
        headline6: _whiteHeadline6,
        headline5: _whiteHeadline5,
      );
}
