import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const myTextStyle = GoogleFonts.ebGaramond;
final myTextTheme = GoogleFonts.ebGaramondTextTheme();

/* Class for App Theming */
class AppTheme {
  /* Light Mode Color Pallete */
  static final kcolorScheme = const ColorScheme.light().copyWith(
    background: const Color(0xffF7F7F7),
    onBackground: const Color.fromARGB(209, 8, 9, 10),
    primary: Colors.blue[800],
    secondary: Colors.grey[200],
    tertiary: const Color.fromARGB(197, 0, 140, 255),
    surface: const Color.fromARGB(255, 245, 242, 228),
  );

  /* Light Mode Theme */
  static final selfTheme = ThemeData().copyWith(
    scaffoldBackgroundColor: kcolorScheme.background,
    colorScheme: kcolorScheme,
    iconButtonTheme: IconButtonThemeData(
      style: const ButtonStyle().copyWith(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: const ButtonStyle().copyWith(
            backgroundColor:
                MaterialStatePropertyAll(kcolorScheme.background))),
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
//
//
//

  /* Dark Mode Color Pallete */
  static const darkColorScheme = ColorScheme.dark(
    background: Color(0xff121212),
    onBackground: Color(0xfff5f6f6),
    primary: Color.fromARGB(255, 62, 116, 202),
    secondary: Color(0xff7CB9E8),
    surface: Color(0xff121212),
    error: Color(0xffCF6679),
    brightness: Brightness.dark,
  );

  /* Dark Mode Theme */
  static final selfDarkTheme = ThemeData.dark().copyWith(
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
      titleSmall:
          myTextStyle(color: darkModePrimaryText, fontWeight: FontWeight.w400),
      titleMedium:
          myTextStyle(color: darkModePrimaryText, fontWeight: FontWeight.w400),
      titleLarge:
          myTextStyle(color: darkModePrimaryText, fontWeight: FontWeight.w400),
      bodyLarge:
          myTextStyle(color: darkModePrimaryText, fontWeight: FontWeight.w500),
      bodyMedium:
          myTextStyle(color: darkModePrimaryText, fontWeight: FontWeight.w500),
      bodySmall:
          myTextStyle(color: darkModePrimaryText, fontWeight: FontWeight.w500),
    ),
  );
}

const darkModePrimaryText = Color(0xFFFFFFFF);
const darkModeSecondaryText = Color(0xFFB3B3B3);
