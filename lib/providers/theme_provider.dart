import 'package:flutter/material.dart';
import 'package:task_manager_flutter/theme/theme_extensions.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  // Градиенты для светлой и темной тем
  final LinearGradient _lightGradient = const LinearGradient(
    colors: [Color(0xFFF8F9FA), Color(0xFFFFF9C4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  final LinearGradient _darkGradient = const LinearGradient(
    colors: [Color(0xFF2D2D2D), Color(0xFF4A148C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Акцентные цвета
  final Color _lightAccent = const Color(0xFFFFD700);
  final Color _darkAccent = const Color(0xFF00FF87);

  bool get isDarkMode => _isDarkMode;

  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    colorScheme: _isDarkMode ? _darkColorScheme : _lightColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: _isDarkMode ? Colors.white : Colors.black87,
      ),
    ),
    extensions: <ThemeExtension<dynamic>>{
      GradientExtension(gradient: _isDarkMode ? _darkGradient : _lightGradient),
      AccentColorExtension(color: _isDarkMode ? _darkAccent : _lightAccent),
    }.toList(),
  );

  // Цветовые схемы
  final ColorScheme _lightColorScheme = const ColorScheme.light(
    primary: Color(0xFF6A88E5),
    secondary: Color(0xFF9047FF),
    surface: Colors.white,
    error: Color(0xFFE53935),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black87,
    onError: Colors.white,
  );

  final ColorScheme _darkColorScheme = const ColorScheme.dark(
    primary: Color(0xFF2A2A72),
    secondary: Color(0xFF009FFD),
    surface: Color(0xFF121212),
    error: Color(0xFFEF5350),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white70,
    onError: Colors.redAccent,
  );

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
