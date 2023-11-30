import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final themeData = ThemeData(
  useMaterial3: true,

  // Define the default brightness and colors.
  // primaryColor: const Color(0xFF1DB954), // Spotify's greenish primary color
  // hintColor:
  //     const Color(0xFF1DB954), // Hint color, same as primary for consistency
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF1DB954),

    // primary: const Color(0xFF1DB954),
    // background: const Color(0xFF191414),
    // secondary: const Color(0xFFFFFFFF),
    brightness: Brightness.dark,
  ),

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.

  textTheme: GoogleFonts.plusJakartaSansTextTheme(),
);
