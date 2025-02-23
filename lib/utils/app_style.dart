import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/utils/app_colors.dart';

class AppStyles{
  static TextStyle medium20White = GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.whiteColor);
  static TextStyle medium14White = GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.whiteColor);
  static TextStyle medium24White = GoogleFonts.inter(
      fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.whiteColor);
  static TextStyle medium20Black = GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.blackColor);
  static TextStyle medium14Black = GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.blackColor);

  static TextStyle medium24Black = GoogleFonts.inter(
      fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.blackColor);
  static TextStyle medium12Grey = GoogleFonts.inter(
      fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.greyColor);
  static TextStyle bold16White = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static TextStyle bold20White = GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static TextStyle bold16Black = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.blackColor);
  static TextStyle bold20Black = GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.blackColor);
  static TextStyle bold24Black = GoogleFonts.inter(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blackColor);

  static var medium16Grey;

  static var medium16Black;
}