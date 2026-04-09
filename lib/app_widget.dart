import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Color _alpha(Color color, double opacity) => color.withValues(alpha: opacity);

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme baseColorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF2CB67D),
      brightness: Brightness.dark,
    );
    final ColorScheme colorScheme = baseColorScheme.copyWith(
      primary: const Color(0xFF81E6BE),
      secondary: const Color(0xFFF7C66F),
      surface: const Color(0xFF10211B),
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Dansp Lab',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: const Color(0xFF071410),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        cardColor: colorScheme.surface,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 62,
            height: 1.02,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.8,
            fontFamily: 'Georgia',
            fontFamilyFallback: <String>['Times New Roman', 'serif'],
          ),
          displaySmall: TextStyle(
            fontSize: 42,
            height: 1.08,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.2,
            fontFamily: 'Georgia',
            fontFamilyFallback: <String>['Times New Roman', 'serif'],
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            height: 1.15,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
            fontFamily: 'Georgia',
            fontFamilyFallback: <String>['Times New Roman', 'serif'],
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            height: 1.2,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            fontSize: 17,
            height: 1.55,
            color: Color(0xFFD2E8DE),
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            height: 1.45,
            color: Color(0xFFB4CBBF),
          ),
        ),
        cardTheme: CardThemeData(
          color: _alpha(Colors.white, 0.06),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
            side: BorderSide(
              color: _alpha(Colors.white, 0.08),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: const Color(0xFF062017),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
