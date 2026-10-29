import 'package:flutter/material.dart';

import '../models/game_model.dart';
import '../theme/app_colors.dart';

/// Sampul game. Memakai gambar jaringan bila [Game.imageUrl] terisi,
/// jika kosong/gagal dimuat akan menampilkan gradien dengan ikon kategori.
class GameCover extends StatelessWidget {
  const GameCover({
    super.key,
    required this.game,
    this.width,
    this.height,
    this.borderRadius = 16,
    this.iconSize = 32,
  });

  final Game game;
  final double? width;
  final double? height;
  final double borderRadius;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);

    final fallback = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: radius,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [categoryColor(game.category), AppColors.primary],
        ),
      ),
      child: Center(
        child: Icon(
          categoryIcon(game.category),
          size: iconSize,
          color: Colors.white.withAlpha(220),
        ),
      ),
    );

    if (game.imageUrl.isEmpty) return fallback;

    return ClipRRect(
      borderRadius: radius,
      child: Image.network(
        game.imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => fallback,
      ),
    );
  }
}