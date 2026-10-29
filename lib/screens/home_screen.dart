import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/game_model.dart';
import '../theme/app_colors.dart';
import '../widgets/game_cover.dart';
import '../widgets/game_tile.dart';
import 'detail_screen.dart';
import 'list_screen.dart';

/// Halaman 1: Beranda (pencarian, kategori, game populer & terbaru).
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openList({String? category, String query = ''}) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ListScreen(
          initialCategory: category,
          initialQuery: query,
        ),
      ),
    );
  }

  void _openDetail(Game game) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => DetailScreen(game: game)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final popular = getPopularGames();
    final latest = getLatestGames(limit: 4);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          _buildHeader(context),
          _buildCategories(),
          _buildSectionTitle('Game Populer'),
          _buildPopularList(context, popular),
          _buildSectionTitle('Game Terbaru'),
          for (final game in latest)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GameTile(game: game, onTap: () => _openDetail(game)),
            ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).padding.top + 16,
        20,
        24,
      ),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Info game apa yang kamu butuhkan?',
                      style: TextStyle(color: Colors.white60, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.accent,
                child: Icon(Icons.sports_esports, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 18),
          TextField(
            controller: _searchController,
            textInputAction: TextInputAction.search,
            style: const TextStyle(color: Colors.white),
            cursorColor: AppColors.accent,
            onSubmitted: (value) => _openList(query: value.trim()),
            decoration: InputDecoration(
              hintText: 'Masukkan judul game',
              hintStyle: const TextStyle(color: Colors.white54, fontSize: 13),
              filled: true,
              fillColor: AppColors.primaryLight,
              prefixIcon: const Icon(Icons.search, color: AppColors.accent),
              suffixIcon: IconButton(
                icon: const Icon(Icons.arrow_forward_rounded),
                color: AppColors.accent,
                onPressed: () =>
                    _openList(query: _searchController.text.trim()),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
      child: Row(
        children: [
          for (final category in gameCategories)
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => _openList(category: category),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    children: [
                      Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: categoryColor(category),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          categoryIcon(category),
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        category,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 12, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _openList(),
            child: const Text(
              'Lihat semua',
              style: TextStyle(color: AppColors.accent),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularList(BuildContext context, List<Game> games) {
    final cardWidth =
    (MediaQuery.of(context).size.width * 0.72).clamp(240.0, 360.0).toDouble();

    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: games.length,
        separatorBuilder: (context, index) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final game = games[index];
          return GestureDetector(
            onTap: () => _openDetail(game),
            child: SizedBox(
              width: cardWidth,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: GameCover(
                      game: game,
                      borderRadius: 18,
                      iconSize: 64,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(14, 24, 14, 12),
                      decoration: const BoxDecoration(
                        borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(18)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black54],
                        ),
                      ),
                      child: Text(
                        game.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}