import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const myTextStyle = GoogleFonts.ebGaramond;
final myTextTheme = GoogleFonts.ebGaramondTextTheme();

var kcolorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xff091235),
).copyWith(
  background: const Color.fromARGB(255, 250, 250, 250),
  onBackground: const Color(0xff08090a),
  primary: Colors.blue[800],
  secondary: Colors.grey[200],
  tertiary: const Color.fromARGB(197, 0, 140, 255),
  surface: const Color.fromARGB(255, 245, 242, 228),
);

//);
//
//
final selfTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: kcolorScheme.background,
  colorScheme: kcolorScheme,
  iconButtonTheme: IconButtonThemeData(
    style: const ButtonStyle().copyWith(),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: const ButtonStyle().copyWith(
          backgroundColor: MaterialStatePropertyAll(kcolorScheme.background))),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: kcolorScheme.primary.withOpacity(0.6),
      selectedItemColor: kcolorScheme.primary,
      elevation: 0),

  appBarTheme: const AppBarTheme().copyWith(
    color: kcolorScheme.primary,
    titleTextStyle: myTextStyle(
      fontWeight: FontWeight.bold,
      color: kcolorScheme.surface,
      fontSize: 35,
    ),
  ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: const ButtonStyle().copyWith(
  //     backgroundColor: MaterialStatePropertyAll(kcolorScheme.secondary),
  //   ),
  // ),
  textTheme: myTextTheme.copyWith(
    titleSmall: myTextStyle(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: myTextStyle(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: myTextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
);
//
//
var darkColorScheme = const ColorScheme.dark(
  background: Color(0xff08090a),
  onBackground: Color(0xfff5f6f6),
  primary: Color(0xffe6e6e6),
  secondary: Color.fromARGB(223, 187, 99, 202),
  surface: Color.fromARGB(255, 24, 23, 29),
  brightness: Brightness.dark,
);
//
//
final selfDarkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: darkColorScheme.background,
  colorScheme: darkColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    color: darkColorScheme.background,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
    selectedItemColor: darkColorScheme.primary,
    unselectedItemColor: darkColorScheme.primary.withOpacity(0.3),
  ),
  splashFactory: NoSplash.splashFactory,
  highlightColor: Colors.transparent,
  textTheme: myTextTheme.copyWith(
    titleSmall: myTextStyle(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: myTextStyle(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: myTextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
);
