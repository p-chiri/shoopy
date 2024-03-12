import 'package:flutter/material.dart';
import 'package:rentit/values/app_bar_theme.dart';
import 'package:rentit/values/bottom_sheet_theme.dart';
import 'package:rentit/values/elevated_button_theme.dart';
import 'package:rentit/values/outlinebutton_theme.dart';
import 'package:rentit/values/text_theme.dart';
import 'package:rentit/values/textfield_theme.dart';

import 'app_colors.dart';

class AppTheme {
  static final textFormFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: AppColors.grey,
      width: 1.6,
    ),
  );

  static  ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorSchemeSeed: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 34,
        letterSpacing: 0.5,
      ),
      bodySmall: TextStyle(
        color: Colors.grey,
        fontSize: 14,
        letterSpacing: 0.5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      errorStyle: const TextStyle(
        fontSize: 12,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 14,
      ),
      border: textFormFieldBorder,
      errorBorder: textFormFieldBorder,
      focusedBorder: textFormFieldBorder,
      focusedErrorBorder: textFormFieldBorder,
      enabledBorder: textFormFieldBorder,
      labelStyle: const TextStyle(
        fontSize: 17,
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        minimumSize: const Size(double.infinity, 50),
        side: BorderSide(
          color: Colors.grey.shade200,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(double.infinity, 52),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.black,
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          AppColors.primaryColor,
        ),
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TAppTheme.lightTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButton.lightElevatedButton,
    outlinedButtonTheme: TOutlinedButton.lightOutlinedButton,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TAppTheme.darkTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButton.darkElevatedButton,
    outlinedButtonTheme: TOutlinedButton.darkOutlinedButton,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme
  );

}