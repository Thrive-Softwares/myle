import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(25, 25, 25, 25),
    primary: const Color.fromARGB(255, 105, 105, 105),
    secondary: const Color.fromARGB(255, 30, 30, 30),
    tertiary: const Color.fromARGB(255, 47, 47, 47),
    inversePrimary: Colors.grey.shade300,
  ),
);

ThemeData blue = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 9, 28, 51),
    primary: const Color.fromARGB(255, 155, 178, 202),
    secondary: const Color.fromARGB(255, 25, 48, 75),
    tertiary: const Color.fromARGB(255, 55, 85, 117),
    inversePrimary: const Color.fromARGB(255, 255, 255, 255),
  ),
);

ThemeData forest = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 19, 58, 45),
    primary: const Color.fromARGB(255, 111, 151, 115),
    secondary: const Color.fromARGB(255, 174, 104, 26),
    tertiary: const Color.fromARGB(255, 136, 77, 9),
    inversePrimary: const Color.fromARGB(255, 255, 255, 255),
  ),
);

ThemeData cozy = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 88, 72, 104),
    primary: const Color.fromARGB(255, 212, 138, 112),
    secondary: const Color.fromARGB(255, 104, 73, 131),
    tertiary: const Color.fromARGB(255, 161, 125, 186),
    inversePrimary: const Color.fromARGB(255, 252, 248, 255),
  ),
);