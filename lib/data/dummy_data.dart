import '../models/game_model.dart';

/// Daftar kategori yang tampil di beranda.
const List<String> gameCategories = [
  'Menembak',
  'Balap',
  'Strategi',
  'Sport',
  'RPG',
];

/// Data dummy dalam format JSON (List<Map>).
/// Nantinya cukup diganti dengan hasil decode respons API.
/// Catatan: data hanya contoh/perkiraan untuk keperluan tugas.
const List<Map<String, dynamic>> dummyGamesJson = [
  {
    'id': 1,
    'title': 'Overwatch 2',
    'genre': 'Shooter',
    'category': 'Menembak',
    'developer': 'Blizzard Entertainment',
    'release_date': '2022-10-04',
    'rating': 4.3,
    'is_popular': true,
    'image_url': '',
    'description':
    'Overwatch 2 adalah game penembak berbasis tim 5 lawan 5 dengan para hero yang memiliki kemampuan unik. Pemain bekerja sama merebut objektif di berbagai peta dengan gaya bermain yang cepat dan strategis. Game ini dapat dimainkan secara gratis dan rutin menerima pembaruan hero serta musim baru.',
    'system_requirements': {
      'os': 'Windows 10 64-bit',
      'processor': 'Intel Core i3 atau setara',
      'memory': '6 GB',
      'graphics': 'NVIDIA GeForce GTX 600 series atau setara',
      'storage': '50 GB',
    },
  },
  {
    'id': 2,
    'title': 'Diablo Immortal',
    'genre': 'MMOARPG',
    'category': 'RPG',
    'developer': 'Blizzard Entertainment',
    'release_date': '2022-06-02',
    'rating': 4.0,
    'is_popular': false,
    'image_url': '',
    'description':
    'Diablo Immortal membawa dunia gelap Sanctuary ke perangkat mobile dan PC. Pemain menjelajahi dungeon, mengalahkan monster, dan mengumpulkan perlengkapan langka bersama pemain lain secara daring. Tersedia berbagai kelas karakter dengan gaya bertarung yang berbeda.',
    'system_requirements': {
      'os': 'Windows 7 SP1 64-bit',
      'processor': 'Intel Core i5 atau setara',
      'memory': '4 GB',
      'graphics': 'NVIDIA GeForce GTX 660 atau setara',
      'storage': '15 GB',
    },
  },
  {
    'id': 3,
    'title': 'Lost Ark',
    'genre': 'ARPG',
    'category': 'RPG',
    'developer': 'Smilegate RPG',
    'release_date': '2022-02-11',
    'rating': 4.1,
    'is_popular': false,
    'image_url': '',
    'description':
    'Lost Ark adalah action RPG dengan sudut pandang isometrik yang menawarkan pertarungan intens, dunia luas, dan banyak kelas karakter. Pemain dapat menjalani cerita utama, menantang raid, hingga berlayar menjelajahi pulau-pulau tersembunyi.',
    'system_requirements': {
      'os': 'Windows 10 64-bit',
      'processor': 'Intel Core i3 atau setara',
      'memory': '8 GB',
      'graphics': 'NVIDIA GeForce GTX 460 atau setara',
      'storage': '50 GB',
    },
  },
  {
    'id': 4,
    'title': 'PUBG: BATTLEGROUNDS',
    'genre': 'Shooter',
    'category': 'Menembak',
    'developer': 'KRAFTON',
    'release_date': '2022-01-12',
    'rating': 4.2,
    'is_popular': false,
    'image_url': '',
    'description':
    'PUBG: BATTLEGROUNDS adalah game battle royale di mana puluhan pemain bertarung hingga tersisa satu tim terakhir. Pemain harus mencari senjata, kendaraan, dan perlengkapan sambil menyesuaikan diri dengan zona aman yang terus mengecil.',
    'system_requirements': {
      'os': 'Windows 10 64-bit',
      'processor': 'Intel Core i5-4430 atau setara',
      'memory': '8 GB',
      'graphics': 'NVIDIA GeForce GTX 960 atau setara',
      'storage': '40 GB',
    },
  },
  {
    'id': 5,
    'title': 'Enlisted',
    'genre': 'Shooter',
    'category': 'Menembak',
    'developer': 'Darkflow Software',
    'release_date': '2021-04-08',
    'rating': 3.9,
    'is_popular': false,
    'image_url': '',
    'description':
    'Enlisted adalah game penembak skuad bertema Perang Dunia II. Pemain dapat berpindah mengendalikan anggota pasukan, kendaraan, dan artileri dalam pertempuran berskala besar yang menuntut kerja sama tim.',
    'system_requirements': {
      'os': 'Windows 7 64-bit',
      'processor': 'Intel Core i5 atau setara',
      'memory': '8 GB',
      'graphics': 'NVIDIA GeForce GTX 660 atau setara',
      'storage': '25 GB',
    },
  },
  {
    'id': 6,
    'title': 'Forge of Empires',
    'genre': 'Strategy',
    'category': 'Strategi',
    'developer': 'InnoGames',
    'release_date': '2012-04-17',
    'rating': 3.8,
    'is_popular': false,
    'image_url': '',
    'description':
    'Forge of Empires adalah game strategi membangun kota yang membawa pemain melintasi zaman, dari Zaman Batu hingga masa depan. Pemain mengelola sumber daya, meneliti teknologi, dan berdagang atau bertempur dengan pemain lain.',
    'system_requirements': {
      'os': 'Windows 7 atau lebih baru',
      'processor': 'Dual core 2 GHz',
      'memory': '2 GB',
      'graphics': 'Mendukung WebGL',
      'storage': '1 GB',
    },
  },
  {
    'id': 7,
    'title': 'Genshin Impact',
    'genre': 'ARPG',
    'category': 'RPG',
    'developer': 'HoYoverse',
    'release_date': '2020-09-28',
    'rating': 4.6,
    'is_popular': true,
    'image_url': '',
    'description':
    'Genshin Impact adalah game action RPG dunia terbuka di benua Teyvat. Pemain menjelajah, memecahkan teka-teki, dan bertarung dengan memadukan kekuatan elemen dari berbagai karakter. Jika kamu mencari game open-world ARPG dengan visual memukau, game ini layak dicoba.',
    'system_requirements': {
      'os': 'Windows 7 SP1 64-bit',
      'processor': 'Intel Core i7 atau setara',
      'memory': '16 GB',
      'graphics': 'NVIDIA GeForce GTX 1060 6GB atau lebih baik',
      'storage': '30 GB',
    },
  },
  {
    'id': 8,
    'title': 'Forza Horizon 5',
    'genre': 'Racing',
    'category': 'Balap',
    'developer': 'Playground Games',
    'release_date': '2021-11-09',
    'rating': 4.7,
    'is_popular': true,
    'image_url': '',
    'description':
    'Forza Horizon 5 adalah game balap dunia terbuka dengan latar Meksiko yang luas dan beragam. Pemain dapat mengikuti balapan, festival, dan tantangan dengan ratusan mobil yang bisa dimodifikasi sesuka hati.',
    'system_requirements': {
      'os': 'Windows 10 versi 15063 atau lebih baru',
      'processor': 'Intel Core i5-4460 atau setara',
      'memory': '8 GB',
      'graphics': 'NVIDIA GeForce GTX 970 atau setara',
      'storage': '110 GB',
    },
  },
  {
    'id': 9,
    'title': 'EA SPORTS FC 24',
    'genre': 'Sports',
    'category': 'Sport',
    'developer': 'EA Vancouver',
    'release_date': '2023-09-29',
    'rating': 4.0,
    'is_popular': false,
    'image_url': '',
    'description':
    'EA SPORTS FC 24 adalah game simulasi sepak bola dengan ribuan pemain dan klub dari berbagai liga dunia. Tersedia mode karier, mode online, dan Ultimate Team untuk membangun skuad impian.',
    'system_requirements': {
      'os': 'Windows 10 64-bit',
      'processor': 'Intel Core i5-6600K atau setara',
      'memory': '8 GB',
      'graphics': 'NVIDIA GeForce GTX 1050 Ti atau setara',
      'storage': '100 GB',
    },
  },
  {
    'id': 10,
    'title': 'Age of Empires IV',
    'genre': 'Strategy',
    'category': 'Strategi',
    'developer': 'Relic Entertainment',
    'release_date': '2021-10-28',
    'rating': 4.4,
    'is_popular': false,
    'image_url': '',
    'description':
    'Age of Empires IV adalah game strategi waktu nyata yang mengangkat peradaban bersejarah dari Abad Pertengahan. Pemain membangun basis, mengelola ekonomi, dan memimpin pasukan dalam kampanye maupun pertandingan daring.',
    'system_requirements': {
      'os': 'Windows 10 64-bit',
      'processor': 'Intel Core i5 atau setara',
      'memory': '8 GB',
      'graphics': 'NVIDIA GeForce GTX 970 atau setara',
      'storage': '50 GB',
    },
  },
  {
    'id': 11,
    'title': 'Valorant',
    'genre': 'Tactical Shooter',
    'category': 'Menembak',
    'developer': 'Riot Games',
    'release_date': '2020-06-02',
    'rating': 4.4,
    'is_popular': true,
    'image_url': '',
    'description':
    'Valorant adalah game penembak taktis 5 lawan 5 yang memadukan akurasi tembakan dengan kemampuan khusus setiap agen. Pemain bergantian menyerang dan bertahan dengan strategi tim yang matang.',
    'system_requirements': {
      'os': 'Windows 10 64-bit',
      'processor': 'Intel Core 2 Duo E8400 atau setara',
      'memory': '4 GB',
      'graphics': 'Intel HD 4000 atau setara',
      'storage': '30 GB',
    },
  },
  {
    'id': 12,
    'title': 'Rocket League',
    'genre': 'Sports',
    'category': 'Sport',
    'developer': 'Psyonix',
    'release_date': '2015-07-07',
    'rating': 4.5,
    'is_popular': false,
    'image_url': '',
    'description':
    'Rocket League memadukan sepak bola dengan mobil bertenaga roket. Pemain mengendarai mobil, melompat, dan melayang untuk mencetak gol dalam pertandingan yang cepat dan penuh aksi.',
    'system_requirements': {
      'os': 'Windows 7 64-bit',
      'processor': 'Dual core 2.5 GHz',
      'memory': '4 GB',
      'graphics': 'NVIDIA GeForce GTX 760 atau setara',
      'storage': '20 GB',
    },
  },
  {
    'id': 13,
    'title': 'Asphalt 9: Legends',
    'genre': 'Racing',
    'category': 'Balap',
    'developer': 'Gameloft',
    'release_date': '2018-07-25',
    'rating': 4.3,
    'is_popular': false,
    'image_url': '',
    'description':
    'Asphalt 9: Legends adalah game balap arcade dengan aksi lompatan, drift, dan nitro yang spektakuler. Pemain mengoleksi mobil supercar dan berlomba di berbagai lintasan kota di seluruh dunia.',
    'system_requirements': {
      'os': 'Windows 10 64-bit',
      'processor': 'Intel Core i3 atau setara',
      'memory': '4 GB',
      'graphics': 'Intel HD 4000 atau setara',
      'storage': '4 GB',
    },
  },
];

/// Seluruh game hasil parsing JSON dummy.
final List<Game> dummyGames = Game.listFromJson(dummyGamesJson);

/// Game yang ditandai populer.
List<Game> getPopularGames() =>
    dummyGames.where((g) => g.isPopular).toList();

/// Game terbaru berdasarkan tanggal rilis (terbaru di atas).
List<Game> getLatestGames({int limit = 4}) {
  final sorted = [...dummyGames]
    ..sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
  return sorted.take(limit).toList();
}

/// Game berdasarkan kategori.
List<Game> getGamesByCategory(String category) =>
    dummyGames.where((g) => g.category == category).toList();