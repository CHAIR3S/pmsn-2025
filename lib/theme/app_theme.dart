import 'package:flutter/material.dart';

class AppTheme {
  // Fondo general
  static const LinearGradient bgGradient = LinearGradient(
    colors: [Color(0xFF0EA5E9), Color(0xFF7C3AED)], // cyan  violeta
    begin: Alignment(0.3, -1),
    end: Alignment(-0.8, 1),
  );

  // Botón sólido
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF22D3EE), Color(0xFF6366F1)], // teal  indigo
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Trazado del círculo (anillo de fondo)
  static const Color attributeRing = Color(0xFF4F46E5); //indigo
}
