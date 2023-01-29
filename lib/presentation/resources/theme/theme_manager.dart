import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../color/color_manager.dart';
import '../fonts/fonts_manager.dart';
import '../styles/style_manager.dart';
import '../values/values_manager.dart';

ThemeData getLightModeThemeData() {
  return ThemeData(
    // color
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryWhite,
    primaryColorDark: ColorManager.primaryBlack,
    errorColor: ColorManager.error,
    indicatorColor: ColorManager.primary,
    iconTheme: IconThemeData(color: ColorManager.primary),
    backgroundColor: ColorManager.background,
    // text
    textTheme: TextTheme(
      headlineLarge: getTextSemiBoldStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s96,
      ),
      headlineMedium: getTextSemiBoldStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s64,
      ),
      headlineSmall: getTextSemiBoldStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s34,
      ),
      titleLarge: getTextRegularStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s28,
      ),
      titleMedium: getTextRegularStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s24,
      ),
      titleSmall: getTextRegularStyle(
        color: ColorManager.lightWhitePrimary,
        fontSize: FontsSize.s16,
      ),
      bodyLarge: getTextRegularStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s20,
      ),
      bodyMedium: getTextRegularStyle(
        color: ColorManager.lightWhitePrimary,
        fontSize: FontsSize.s20,
      ),
      bodySmall: getTextRegularStyle(
        color: ColorManager.lightWhitePrimary,
        fontSize: FontsSize.s16,
      ),
    ),

    // input
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p12),

      // hint style
      hintStyle: getTextRegularStyle(
        color: ColorManager.primaryWhite,
        fontSize: FontsSize.s16,
      ),

      //label style
      labelStyle: getTextRegularStyle(
        color: ColorManager.primaryWhite,
        fontSize: FontsSize.s16,
      ),

      //enabled
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primaryWhite, width: AppSize.s1),
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),

      //focus
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1),
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),

      //error style
      errorStyle: getTextRegularStyle(
        color: ColorManager.error,
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      suffixIconColor: ColorManager.lightWhitePrimary,
    ),
    // card view
    cardTheme: CardTheme(
      color: ColorManager.primary,
      shadowColor: ColorManager.secondPrimary,
      elevation: AppSize.s2,
    ),

    // app bar
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.background,
      titleTextStyle: getTextRegularStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s34,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.background,
        statusBarIconBrightness: Brightness.light,
      ),
    ),

    // button
    buttonTheme: ButtonThemeData(
      height: AppSize.s40,
      shape: const StadiumBorder(),
      buttonColor: ColorManager.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(
          side: BorderSide(),
        ),
        backgroundColor: ColorManager.primary,
        fixedSize: const Size(AppSize.s60, AppSize.s140),
        elevation: AppSize.s4,
        shadowColor: ColorManager.gradiantOne,
        textStyle: getTextRegularStyle(
          color: ColorManager.white,
          fontSize: FontsSize.s16,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        elevation: AppSize.s2,
        shadowColor: ColorManager.gradiantOne,
        textStyle: getTextRegularStyle(
          color: ColorManager.white,
          fontSize: FontsSize.s16,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          color: ColorManager.white,
          fontSize: FontsSize.s16,
        ),
      ),
    ),

    // floating Action
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: AppSize.s2,
      focusColor: ColorManager.primary,
      foregroundColor: ColorManager.primary,
      backgroundColor: ColorManager.background,
      splashColor: ColorManager.gradiantOne,
      hoverColor: ColorManager.gradiantOne,
      iconSize: AppSize.s40,
    ),

    // navigation Bar
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: ColorManager.primary,
      elevation: AppSize.s2,
    ),

    // bottom navigation bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: AppSize.s2,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: ColorManager.white,
      ),
      unselectedIconTheme: IconThemeData(
        color: ColorManager.gradiantOne,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorManager.primary,
      elevation: AppSize.s6,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.s40),
        ),
      ),
    ),
    listTileTheme: ListTileThemeData(
      textColor: ColorManager.primary,
      iconColor: ColorManager.primary,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorManager.background,
      elevation: AppSize.s6,
    ),
  );
}

ThemeData getDarkModeThemeData() {
  return ThemeData(
    // color
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryWhite,
    primaryColorDark: ColorManager.primaryBlack,
    errorColor: ColorManager.error,
    indicatorColor: ColorManager.primary,
    iconTheme: IconThemeData(color: ColorManager.primary),
    backgroundColor: ColorManager.background,
    // text
    textTheme: TextTheme(
      headlineLarge: getTextSemiBoldStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s96,
      ),
      headlineMedium: getTextSemiBoldStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s64,
      ),
      headlineSmall: getTextSemiBoldStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s34,
      ),
      titleLarge: getTextRegularStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s28,
      ),
      titleMedium: getTextRegularStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s24,
      ),
      titleSmall: getTextRegularStyle(
        color: ColorManager.lightWhitePrimary,
        fontSize: FontsSize.s16,
      ),
      bodyLarge: getTextRegularStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s20,
      ),
      bodyMedium: getTextSemiBoldStyle(
        color: ColorManager.error,
        fontSize: FontsSize.s16,
      ),
    ),

    // input
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p12),

      // hint style
      hintStyle: getTextRegularStyle(
        color: ColorManager.primaryBlack,
        fontSize: FontsSize.s16,
      ),

      //label style
      labelStyle: getTextRegularStyle(
        color: ColorManager.primaryBlack,
        fontSize: FontsSize.s16,
      ),

      //enabled
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primaryBlack, width: AppSize.s1),
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),

      //focus
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1),
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),

      //error style
      errorStyle: getTextRegularStyle(
        color: ColorManager.error,
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      suffixIconColor: ColorManager.lightBlackPrimary,
    ),
    // card view
    cardTheme: CardTheme(
      color: ColorManager.primary,
      shadowColor: ColorManager.secondPrimary,
      elevation: AppSize.s2,
    ),

    // app bar
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.background,
      titleTextStyle: getTextRegularStyle(
        color: ColorManager.white,
        fontSize: FontsSize.s34,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.background,
        statusBarIconBrightness: Brightness.light,
      ),
    ),

    // button
    buttonTheme: ButtonThemeData(
      height: AppSize.s40,
      shape: const StadiumBorder(),
      buttonColor: ColorManager.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(
          side: BorderSide(),
        ),
        backgroundColor: ColorManager.primary,
        fixedSize: const Size(AppSize.s60, AppSize.s140),
        elevation: AppSize.s4,
        shadowColor: ColorManager.gradiantOne,
        textStyle: getTextRegularStyle(
          color: ColorManager.white,
          fontSize: FontsSize.s16,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        elevation: AppSize.s2,
        shadowColor: ColorManager.gradiantOne,
        textStyle: getTextRegularStyle(
          color: ColorManager.white,
          fontSize: FontsSize.s16,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          color: ColorManager.white,
          fontSize: FontsSize.s16,
        ),
      ),
    ),

    // floating Action
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: AppSize.s2,
      focusColor: ColorManager.primary,
      foregroundColor: ColorManager.primary,
      backgroundColor: ColorManager.background,
      splashColor: ColorManager.gradiantOne,
      hoverColor: ColorManager.gradiantOne,
      iconSize: AppSize.s40,
    ),

    // navigation Bar
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: ColorManager.primary,
      elevation: AppSize.s2,
    ),

    // bottom navigation bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: AppSize.s2,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: ColorManager.white,
      ),
      unselectedIconTheme: IconThemeData(
        color: ColorManager.gradiantOne,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorManager.primary,
      elevation: AppSize.s6,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.s24),
        ),
      ),
    ),
    listTileTheme: ListTileThemeData(
      textColor: ColorManager.primary,
      iconColor: ColorManager.primary,
    ),

    drawerTheme: DrawerThemeData(),
  );
}
