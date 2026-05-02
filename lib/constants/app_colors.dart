import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF0F172A);
  static const Color primaryText = Colors.white;
  static const Color secondaryText = Colors.white70;
  static const Color accent = Color(0xFFEAB308);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF0A0A0A);
  static const Color gold = Color(0xFFCA8A04);
  static const Color goldLight = Color(0xFFFBBF24);
  static const Color grayDark = Color(0xFF1F2937);
  static const Color gray = Color(0xFF374151);
  static const Color grayLight = Color(0xFF6B7280);
  static const Color grayLighter = Color(0xFF9CA3AF);

  // ✅ Hapus 'const' di sini
  static LinearGradient get goldGradient => const LinearGradient(
    colors: [Color(0xFFFBBF24), Color(0xFFCA8A04)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}