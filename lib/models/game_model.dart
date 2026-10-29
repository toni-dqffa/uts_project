/// Persyaratan sistem minimum sebuah game.
class SystemRequirements {
  final String os;
  final String processor;
  final String memory;
  final String graphics;
  final String storage;

  const SystemRequirements({
    required this.os,
    required this.processor,
    required this.memory,
    required this.graphics,
    required this.storage,
  });

  factory SystemRequirements.fromJson(Map<String, dynamic> json) {
    return SystemRequirements(
      os: json['os'] as String? ?? '-',
      processor: json['processor'] as String? ?? '-',
      memory: json['memory'] as String? ?? '-',
      graphics: json['graphics'] as String? ?? '-',
      storage: json['storage'] as String? ?? '-',
    );
  }

  Map<String, dynamic> toJson() => {
    'os': os,
    'processor': processor,
    'memory': memory,
    'graphics': graphics,
    'storage': storage,
  };

  /// Label -> nilai, siap ditampilkan sebagai tabel di halaman detail.
  Map<String, String> toDisplayMap() => {
    'OS': os,
    'Processor': processor,
    'Memory': memory,
    'Graphics': graphics,
    'Storage': storage,
  };
}

/// Model data game. Kunci JSON memakai snake_case agar mudah
/// disesuaikan dengan respons API pada tahap pengembangan berikutnya.
class Game {
  final int id;
  final String title;
  final String genre;
  final String category;
  final String developer;
  final DateTime releaseDate;
  final double rating;
  final bool isPopular;
  final String imageUrl;
  final String description;
  final SystemRequirements requirements;

  const Game({
    required this.id,
    required this.title,
    required this.genre,
    required this.category,
    required this.developer,
    required this.releaseDate,
    required this.rating,
    required this.isPopular,
    required this.imageUrl,
    required this.description,
    required this.requirements,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as int,
      title: json['title'] as String,
      genre: json['genre'] as String,
      category: json['category'] as String,
      developer: json['developer'] as String? ?? '-',
      releaseDate: DateTime.parse(json['release_date'] as String),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      isPopular: json['is_popular'] as bool? ?? false,
      imageUrl: json['image_url'] as String? ?? '',
      description: json['description'] as String? ?? '',
      requirements: SystemRequirements.fromJson(
        json['system_requirements'] as Map<String, dynamic>? ?? {},
      ),
    );
  }

  /// Mengubah list JSON (mis. dari file lokal atau API) menjadi list [Game].
  static List<Game> listFromJson(List<dynamic> list) {
    return list
        .map((e) => Game.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'genre': genre,
    'category': category,
    'developer': developer,
    'release_date': releaseDate.toIso8601String().substring(0, 10),
    'rating': rating,
    'is_popular': isPopular,
    'image_url': imageUrl,
    'description': description,
    'system_requirements': requirements.toJson(),
  };

  static const List<String> _bulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  /// Contoh: "04 Oktober 2022".
  String get formattedDate {
    final d = releaseDate.day.toString().padLeft(2, '0');
    return '$d ${_bulan[releaseDate.month - 1]} ${releaseDate.year}';
  }
}