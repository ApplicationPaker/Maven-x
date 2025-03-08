import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

enum DeviceSize {
  mobile,
  tablet,
  desktop,
  window,
}

class AppTheme {

  //* ------------------ Button Style ------------------

  static final buttonStyle = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: kPadding * 3, vertical: kPadding),
    ),
    elevation: MaterialStateProperty.all(0),
    fixedSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(55),
      ),
    ),
  );

  
  //* ------------------ Dark Theme ------------------

  ThemeData dark = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: kDarkCardColor,
      iconTheme: IconThemeData(color: kWhiteColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primaryColor: kWhiteColor,
    cardColor: kDarkBackgroundColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: kPrimaryColor,
      onPrimary: kPrimaryColor,
      secondary: kWhiteColor,
      onSecondary: kWhiteColor,
      surface: kDarkBackgroundColor,
      onSurface: kDarkCardColor,
      error: kRedColor,
      onError: kRedColor,
      background: kDarkBackgroundColor,
      onBackground: kDarkGreyColor,
    ),
    
    // elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
    // textButtonTheme: TextButtonThemeData(style: buttonStyle),
    // outlinedButtonTheme: OutlinedButtonThemeData(style: buttonStyle),
    // textTheme: TextTheme(
    //   //     //* ------------------ Headlines ------------------

    //   displayLarge: _getResponsiveTextStyle(57, 45, 32, true),
    //   displayMedium: _getResponsiveTextStyle(45, 45, 45, true),
    //   displaySmall: _getResponsiveTextStyle(36, 36, 36, true),
    //   headlineLarge: _getResponsiveTextStyle(32, 32, 32, true),
    //   headlineMedium: _getResponsiveTextStyle(50, 50, 32, true),
    //   headlineSmall: _getResponsiveTextStyle(
    //     24,
    //     26,
    //     22,
    //     true,
    //   ),

    //   //     //* ------------------ Body Text ------------------

    //   bodyLarge: _getResponsiveTextStyle(16, 15, 16, true),
    //   bodyMedium: _getResponsiveTextStyle(14, 14, 14, true),
    //   bodySmall: _getResponsiveTextStyle(12, 13, 14, true),

    //   //     //* ------------------ Button Text ------------------

    //   labelLarge: _getResponsiveTextStyle(14, 15, 14, true),

    //   //     //* ------------------ OverLine Text ------------------

    //   labelMedium: _getResponsiveTextStyle(16, 9, 12, true),
    //   labelSmall: _getResponsiveTextStyle(11, 9, 8, true),

    //   titleLarge: _getResponsiveTextStyle(22, 9, 14, true),
    //   titleMedium: _getResponsiveTextStyle(16, 9, 16, true),
    //   titleSmall: _getResponsiveTextStyle(16, 9, 14, true),
    // ),
      
      
       useMaterial3: true,
  );

  static isMobile({BuildContext? context}) {
    return getDeviceSize(context: context) == DeviceSize.mobile;
  }

  static isDesktop({BuildContext? context}) {
    return getDeviceSize(context: context) == DeviceSize.desktop;
  }

  static isTablet({BuildContext? context}) {
    return getDeviceSize(context: context) == DeviceSize.tablet;
  }

  static isWindow({BuildContext? context}) {
    return getDeviceSize(context: context) == DeviceSize.window;
  }

  static DeviceSize getDeviceSize({BuildContext? context}) {
    final width = context != null
        ? MediaQuery.of(context).size.width
        // ignore: deprecated_member_use
        : MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
    if (width < 600) {
      return DeviceSize.mobile;
    } else if (width < 1000) {
      return DeviceSize.tablet;
    } else if (width < 1920) {
      return DeviceSize.desktop;
    } else {
      return DeviceSize.window;
    }
  }

  static TextStyle _getResponsiveTextStyle(double desktopSize,
      double tabletSize, double mobileSize, bool? isDarkMode) {
    return TextStyle(
      color: kWhiteColor,
      fontSize: getDeviceSize() == DeviceSize.desktop ||
              getDeviceSize() == DeviceSize.window
          ? desktopSize
          : getDeviceSize() == DeviceSize.tablet
              ? tabletSize
              : mobileSize,
      height: 1.1,
      fontWeight: FontWeight.w600,
    );
  }
}
