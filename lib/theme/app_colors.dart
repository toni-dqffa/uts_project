import 'package:flutter/material.dart';

/// Palet warna utama aplikasi (mengacu pada contoh GUI di soal).
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF173B45);
  static const Color primaryLight = Color(0xFF244B57);
  static const Color background = Color(0xFFFFEFC2);
  static const Color accent = Color(0xFFFFA000);
  static const Color surface = Colors.white;
  static const Color textDark = Color(0xFF1B2A30);
  static const Color textMuted = Color(0xFF6B7A80);
}

const Map<String, IconData> _categoryIcons = {
  'Menembak': Icons.gps_fixed,
  'Balap': Icons.sports_motorsports,
  'Strategi': Icons.extension,
  'Sport': Icons.sports_basketball,
  'RPG': Icons.shield,
};

const Map<String, Color> _categoryColors = {
  'Menembak': Color(0xFFB8860B),
  'Balap': Color(0xFFC0504D),
  'Strategi': Color(0xFFD4883A),
  'Sport': Color(0xFFE0B040),
  'RPG': Color(0xFF3E8E7E),
};

/// Ikon untuk sebuah kategori game.
IconData categoryIcon(String category) =>
    _categoryIcons[category] ?? Icons.sports_esports;

/// Warna khas untuk sebuah kategori game.
Color categoryColor(String category) =>
    _categoryColors[category] ?? AppColors.accent;