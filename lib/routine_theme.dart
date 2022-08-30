
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class RoutineAppTheme {
static Color lightThemeTextColor = const Color(0xff4d4d4d);
  static Color darkThemeTextColor = const Color(0xfffefefe);

  static TextTheme primaryTextThemeLight = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xff4d4d4d),
    ),
    bodyText2: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xff4d4d4d),
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 34.0,
      fontWeight: FontWeight.w700,
      color: const Color(0xff4d4d4d),
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: const Color(0xff4d4d4d),
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: const Color(0xff4d4d4d),
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: const Color(0xff4d4d4d),
    ),
    headline5: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: const Color(0xff4d4d4d),
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: const Color(0xff4d4d4d),
    ),
    subtitle1: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: const Color(0xff4d4d4d),
    ),
    subtitle2: GoogleFonts.roboto(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xff4d4d4d),
    ),
  );

  static TextTheme primaryTextThemeDark = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
    bodyText2: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 34.0,
      fontWeight: FontWeight.w700,
      color: darkThemeTextColor,
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: darkThemeTextColor,
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: darkThemeTextColor,
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: darkThemeTextColor,
    ),
    headline5: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: darkThemeTextColor,
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: darkThemeTextColor,
    ),
    subtitle1: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: darkThemeTextColor,
    ),
    subtitle2: GoogleFonts.roboto(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
  );
  InputDecorationTheme inputDecorationTheme = const InputDecorationTheme();

  static IconThemeData darkIconTheme = const IconThemeData(color: Color(0xffafafaf));
  static IconThemeData lightIconTheme = IconThemeData(color: Colors.grey[900]);
  static DrawerThemeData drawerTheme = const DrawerThemeData(
    backgroundColor:  Color(0xff1F88C1),
  );

  static DrawerThemeData darkThemeDrawerTheme =const DrawerThemeData(
    backgroundColor: Color(0xff0C4D69),
  );

  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              return Colors.black;
            },
          ),
        ),
        indicatorColor: const Color(0xff1F88C1),
        secondaryHeaderColor: const Color(0xff4d4d4d),
        primaryColor: const Color(0xff1F88C1),
        primaryColorDark: const Color(0xff00374E),
        cardColor: const Color(0xfffdfdfd),
        canvasColor: const Color(0xffefefef),
        backgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        drawerTheme: drawerTheme,
        shadowColor: Colors.grey,
        scaffoldBackgroundColor: const Color(0xffFDFEFF),
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color(0xff1F88C1),
                statusBarBrightness: Brightness.light,
                systemNavigationBarContrastEnforced: false,
                systemNavigationBarColor: Color(0xff1F88C1))),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color(0xff1F88C1),
            backgroundColor: Color(0xffffffff)),
        primaryTextTheme: primaryTextThemeLight);
  }


  static ThemeData dark() {
    Color darkThemeColor = const Color(0xff00161f);
    Color darkCardColor = const Color(0xff062735);
    

    return ThemeData(
        brightness: Brightness.dark,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              return Colors.black;
            },
          ),
        ),
        indicatorColor: const Color(0xff1F88C1),
        secondaryHeaderColor: const Color(0xff4d4d4d),
        primaryColor: const Color(0xff1F88C1),
        primaryColorDark: darkThemeColor,
        backgroundColor: darkThemeColor,
        dialogBackgroundColor: darkCardColor,
        canvasColor: darkCardColor,
        cardColor: darkCardColor,
        drawerTheme: darkThemeDrawerTheme,
        scaffoldBackgroundColor: darkThemeColor,
        shadowColor: Colors.black87,
        iconTheme: darkIconTheme,
        appBarTheme: AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: darkCardColor,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: darkCardColor,
                statusBarBrightness: Brightness.dark,
                systemNavigationBarContrastEnforced: false,
                systemNavigationBarColor: const Color(0xff1F88C1))),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: const Color(0xff29ABE2),
            backgroundColor: darkCardColor),
        primaryTextTheme: primaryTextThemeDark);
  }


}
