import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {


  AppTheme._();

  static const Color darkBackgroundColor = Color(0xFF181C1E);
  static const Color darkCardColor = Color(0xFF262F34);
  static const Color darkLightColor = Color(0xFF656D77);
  static const Color lightBackgroundColor = Color(0xFFFFFFFF);
  static const Color lightComponentsColor = Color(0xFF40CAFF);
  static const Color lightCardColor = Color(0xFFF4F8FA);
  static const Color primaryColor = Color(0xFFFF9900);
  static const Color errorColor = Color(0xFFD73A49);
  static const Color btnColor = Color(0xFFFF9900);
  static const Color lightTextColor = Color(0xFFF4F8FA);
  static const Color fieldTextColor = Color(0xFFF2F2F2);
  static const Color dotTextColor = Color(0xFF707070);
  static const Color darkTextColor = Color(0xFF181C1E);
  static const Color  boxShadowColor = Color(0x1F000000);
  static const Color splashColor = Color(0x1F000000);
  static const Color graphColorPurple = Color(0xFFC855CB);
  static const Color graphColorOrange = Color(0xFFFF9900);
  static Color iconColorClockt = const Color(0xFFFF9900).withOpacity(0.5);
  static Color iconColorClock = const Color(0xFFFF9900);


  static Color iconColorAwardt = const Color(0xFFC855CB).withOpacity(0.5);
  static Color iconColorAward = const Color(0xFFC855CB);
  static Color iconColorMotivationalt = const Color(0xFF629DF9).withOpacity(0.5);
  static Color iconColorMotivational = const Color(0xFF629DF9);
  static Color iconColorPerformance = const Color(0xFF9B9B9B).withOpacity(0.5);
  static Color iconColorsmart =  Colors.black54;
  static Color conSubTitleColor = const Color(0xFF9B9B9B);

  static LinearGradient rootLinearGradient = LinearGradient(
    colors: [
      const Color(0xFF959595).withOpacity(0.6),
      const Color(0xFFCC4BD5).withOpacity(0.3),
      const Color(0xFFAA9387).withOpacity(0.3),
      const Color(0xFFE6B772).withOpacity(0.4),
      const Color(0xFFFFBB56).withOpacity(0.2),
    ],
    begin: FractionalOffset.bottomLeft,
    end: FractionalOffset.topCenter,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      primaryColor: lightBackgroundColor,
      backgroundColor: lightBackgroundColor,
      scaffoldBackgroundColor: lightBackgroundColor,
      primaryColorLight: const Color(0xFFF1F1F1),
      splashColor: splashColor,
      brightness: Brightness.light,
      errorColor: errorColor,
      accentColorBrightness: Brightness.light,
      highlightColor: splashColor,
      focusColor: primaryColor,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline1: TextStyle(
          letterSpacing: 1,
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headline2: TextStyle(
          fontSize: 11.sp,
          color: Colors.black,
        ),
        headline3: TextStyle(
          fontSize: 18.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        headline5: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontSize: 12.sp,
          color: Colors.black,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          primary: btnColor,
          shape: RoundedRectangleBorder(
              //to set border radius to button
              borderRadius: BorderRadius.circular(28)),
        ),
      ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: primaryColor), colorScheme: ColorScheme.fromSwatch()
          .copyWith(
            secondary: const Color(0xFF79A6DC),
            brightness: Brightness.light,
          )
          .copyWith(secondary: primaryColor).copyWith(secondary: primaryColor),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      canvasColor: darkBackgroundColor,
      primaryColor: darkBackgroundColor,
      backgroundColor: darkBackgroundColor,
      unselectedWidgetColor: Colors.blueGrey.withOpacity(0.4),
      scaffoldBackgroundColor: darkBackgroundColor,
      primaryColorLight: const Color(0xFF2D333A),
      focusColor: const Color(0xFF444C56),
      errorColor: errorColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      dividerColor: Colors.white,
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Color(0xffFAFAFA),
        ),
        headline2: TextStyle(
          color: Color(0xffFAFAFA),
        ),
        bodyText1: TextStyle(
          color: Color(0xffFAFAFA),
        ),
        bodyText2: TextStyle(
          color: Color(0xffFAFAFA),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: const Color(0xFF6E7681),
        brightness: Brightness.dark,
      ),
    );
  }
}

extension MyThemeData on ThemeData {
  bool get isDarkTheme => brightness == Brightness.dark;

  bool get isLightTheme => brightness == Brightness.light;
}
