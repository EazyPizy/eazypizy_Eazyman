import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: EazyColors.background,
  // primaryColor: EazyColors.primary,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    iconSize: 32,
    backgroundColor: EazyColors.primary,
    foregroundColor: EazyColors.background,
  ),
  appBarTheme:  AppBarTheme(
    elevation: 0.5,
    backgroundColor: EazyColors.appBarBG,
    surfaceTintColor: EazyColors.appBarBG,
    titleTextStyle: TextStyle(
        fontFamily: 'Signika',
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
        color: EazyColors.black
    ),
    iconTheme: const IconThemeData(
      color: EazyColors.primary,
      size: 20,


    ),
  ),
  textTheme: TextTheme(
    titleSmall: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.normal,
      fontSize: 12.sp,
      color: EazyColors.lightBlack,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.normal,
      fontSize: 14.sp,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.normal,
      fontSize: 18.sp,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.w100,
      fontSize: 10.sp,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.normal,
      fontSize: 20.sp,
      color: EazyColors.black,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.normal,
      fontSize: 25.sp,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.bold,
      fontSize: 10.sp,
      color: EazyColors.white,
    ),
  ),
  iconTheme: const IconThemeData(color: EazyColors.primary, size:18 ),
);
