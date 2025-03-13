import 'package:flutter/material.dart';

@immutable
class GradientExtension extends ThemeExtension<GradientExtension> {
  final LinearGradient gradient;

  const GradientExtension({required this.gradient});

  @override
  ThemeExtension<GradientExtension> copyWith({LinearGradient? gradient}) {
    return GradientExtension(gradient: gradient ?? this.gradient);
  }

  @override
  ThemeExtension<GradientExtension> lerp(
      ThemeExtension<GradientExtension>? other, double t) {
    if (other is! GradientExtension) return this;
    return GradientExtension(
    gradient: LinearGradient.lerp(gradient, other.gradient, t) ?? gradient,
    );
  }
}

@immutable
class AccentColorExtension extends ThemeExtension<AccentColorExtension> {
  final Color color;

  const AccentColorExtension({required this.color});

  @override
  ThemeExtension<AccentColorExtension> copyWith({Color? color}) {
    return AccentColorExtension(color: color ?? this.color);
  }

  @override
  ThemeExtension<AccentColorExtension> lerp(
      ThemeExtension<AccentColorExtension>? other, double t) {
    if (other is! AccentColorExtension) return this;
    return AccentColorExtension(
    color: Color.lerp(color, other.color, t) ?? color,
    );
  }
}
