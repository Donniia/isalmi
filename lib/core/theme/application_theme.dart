import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static bool isDark = true;
  static ThemeData lighttheme = ThemeData(
    primaryColor: const Color(0xffB7935F),
    colorScheme: ColorScheme.fromSeed(
      primary: const Color(0xffB7935F),
      seedColor: const Color(0xffB7935F),
      onSecondary: const Color(0xffB7935F),
      secondary: Colors.black,
      primaryContainer: Colors.white.withOpacity(0.6),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor:  Color(0xffB7935F),
      selectedIconTheme: IconThemeData(color: Colors.black, size: 30),
      selectedItemColor:  Colors.black,
      unselectedIconTheme: IconThemeData(color: Colors.white, size: 28),
      unselectedItemColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        iconTheme:const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black)),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 25,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.elMessiri(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    dividerColor: const Color(0xffB7935F),
  );

  static ThemeData darktheme = ThemeData(
    primaryColor: const Color(0xff141A2E),
    colorScheme: ColorScheme.fromSeed(
        primary: const Color(0xff141A2E),
        seedColor: const Color(0xff141A2E),
        onSecondary: const Color(0xffFACC1D),
        secondary: Colors.white,
        primaryContainer: const Color(0xff141A2E).withOpacity(0.8)
    ),
    bottomNavigationBarTheme:const  BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff141A2E),
      selectedIconTheme: IconThemeData(color: Color(0xffFACC1D), size: 30),
      selectedItemColor: Color(0xffFACC1D),
      unselectedIconTheme: IconThemeData(color: Colors.white, size: 28),
      unselectedItemColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        iconTheme:const IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white)),
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: const Color(0xffFACC1D),
        ),
        bodyMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 25,
          color: const Color(0xffFACC1D),
        ),
        bodySmall: GoogleFonts.elMessiri(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: const Color(0xffFACC1D),
        )),
    dividerColor: const Color(0xffFACC1D),
  );
}
