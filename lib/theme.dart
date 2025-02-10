import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kcolorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xff091235),
).copyWith(
  background: const Color.fromARGB(255, 245, 242, 228),
  primary: const Color(0xff2B4257),
  secondary: const Color(0xff091235),
  tertiary: const Color.fromARGB(197, 107, 120, 131),
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
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: kcolorScheme.primary.withOpacity(0.6),
      selectedItemColor: kcolorScheme.primary,
      elevation: 0),

  appBarTheme: const AppBarTheme().copyWith(
    titleTextStyle: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
      color: kcolorScheme.secondary,
      fontSize: 35,
    ),
  ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: const ButtonStyle().copyWith(
  //     backgroundColor: MaterialStatePropertyAll(kcolorScheme.secondary),
  //   ),
  // ),
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
);
//
//
var darkColorScheme = const ColorScheme.dark(
  background: Color.fromARGB(255, 24, 23, 29),
  onBackground: Color.fromARGB(255, 45, 42, 54),
  primary: Color.fromARGB(255, 194, 93, 212),
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
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
);
