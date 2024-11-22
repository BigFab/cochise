import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class BasilTheme extends ThemeExtension<BasilTheme> {
  const BasilTheme ({
    this. primaryColor = const Color (0xFF356859),
    this. tertiaryColor = const Color (0xFFFF5722),
    this.neutralColor = const Color (0xFFFFFBE6),
  });

  final Color primaryColor, tertiaryColor, neutralColor;

  ThemeData _base() {
    final primaryTextTheme = GoogleFonts.lektonTextTheme();
    final secondaryTextTheme = GoogleFonts.montserratTextTheme();
    final textTheme = primaryTextTheme.copyWith(
      displaySmall: secondaryTextTheme.displaySmall
    );
    return ThemeData(textTheme: textTheme);
  }

  ThemeData toThemeData() {
    return ThemeData(useMaterial3: true);
  }

  @override
  ThemeExtension<BasilTheme> copyWith({
    Color? primaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) => 
  BasilTheme(
    primaryColor: primaryColor ?? this.primaryColor,
    tertiaryColor: tertiaryColor ?? this.tertiaryColor,
    neutralColor: neutralColor ?? this.neutralColor
  );

  @override
  BasilTheme lerp(covariant ThemeExtension<BasilTheme>? other, double t) {
    if (other is! BasilTheme) return this;
    return BasilTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!
    );
  }
}