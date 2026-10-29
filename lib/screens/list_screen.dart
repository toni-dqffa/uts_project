import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/game_model.dart';
import '../theme/app_colors.dart';
import '../widgets/game_tile.dart';
import 'detail_screen.dart';

/// Halaman 2: Daftar game (bisa difilter per kategori dan dicari).
class ListScreen extends StatefulWidget {
  const ListScreen({
    super.key,
    this.initialCategory,
    this.initialQuery = '',
  });

  final String? initialCategory;
  final String initialQuery;

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late final TextEditingController _controller;
  String? _category;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _category = widget.initialCategory;
    _query = widget.initialQuery;
    _controller = TextEditingController(text: widget.initialQuery);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Game> get _filteredGames {
    final base =
    _category == null ? [...dummyGames] : getGamesByCategory(_category!);
    final q = _query.toLowerCase();
    final result = q.isEmpty
        ? base
        : base
        .where((g) =>
    g.title.toLowerCase().contains(q) ||
        g.genre.toLowerCase().contains(q))
        .toList();
    result.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
    return result;
  }

  void _openDetail(Game game) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => DetailScreen(game: game)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final games = _filteredGames;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          _category == null ? 'Daftar Game' : 'Game $_category',
          style: const TextStyle(fontSize: 18),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: TextField(
                  controller: _controller,
                  onChanged: (value) => setState(() => _query = value.trim()),
                  decoration: InputDecoration(
                    hintText: 'Cari judul atau genre',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon:
                    const Icon(Icons.search, color: AppColors.accent),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 44,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildChip('Semua', null),
                    for (final c in gameCategories) _buildChip(c, c),
                  ],
                ),
              ),
              Expanded(
                child: games.isEmpty
                    ? const Center(
                  child: Text(
                    'Game tidak ditemukan',
                    style: TextStyle(color: AppColors.textMuted),
                  ),
                )
                    : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return GameTile(
                      game: game,
                      onTap: () => _openDetail(game),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, String? value) {
    final selected = _category == value;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        showCheckmark: false,
        selectedColor: AppColors.accent,
        backgroundColor: Colors.white,
        side: BorderSide.none,
        labelStyle: TextStyle(
          color: selected ? Colors.white : AppColors.textDark,
          fontWeight: FontWeight.w600,
        ),
        onSelected: (_) => setState(() => _category = value),
      ),
    );
  }
}