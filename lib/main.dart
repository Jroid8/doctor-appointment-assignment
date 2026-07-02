import 'package:doctor_appointment/features/auth/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

const TextTheme textTheme = TextTheme(
  titleLarge: TextStyle(
    color: Color(0xFF1C2A3A),
    fontSize: 16,
    fontWeight: .w700,
  ),
  titleMedium: TextStyle(
    color: Color(0xFF4B5563),
    fontSize: 12,
    fontWeight: .w700,
  ),
  bodyLarge: TextStyle(
    color: Color(0xFF6B7280),
    fontSize: 14,
    fontWeight: .w500,
  ),
  bodyMedium: TextStyle(
    color: Color(0xFF6B7280),
    fontSize: 14,
    fontWeight: .w400,
  ),
  headlineMedium: TextStyle(color: Color(0xFF1C2A3A)),
  headlineLarge: TextStyle(
    color: Color(0xFF1C2A3A),
    fontSize: 20,
    fontWeight: .w600,
  ),
  labelLarge: TextStyle(
    color: Color(0xFF374151),
    fontSize: 20,
    fontWeight: .w600,
  ),
  labelMedium: TextStyle(
    color: Color(0xFF374151),
    fontSize: 14,
    fontWeight: .w600,
  ),
);

const ColorScheme colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF1C2A3A),
  secondary: Color(0xFFEEEEEE),
  surface: Colors.white,
  onPrimary: Colors.white,
  onSecondary: Color(0xFF1C2A3A),
  onSurface: Color(0xFF1C2A3A),
  error: Color(0xFFDC3545),
  onError: Colors.white,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        title: 'HealthPal',
        themeMode: .light,
        theme: ThemeData(
          textTheme: textTheme,
          colorScheme: colorScheme,
          fontFamily: "Inter",
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
