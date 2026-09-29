
class MangaTitle {
  final int titleId;
  final String title;
  final String coverUrl;
  final String synopsis;
  final List<String> genres;
  final int chapterCount;
  final String countryOfOrigin; 
  final DateTime? dateSaved; 

  MangaTitle({
    required this.titleId,
    required this.title,
    required this.coverUrl,
    required this.synopsis,
    required this.genres,
    required this.chapterCount,
    required this.countryOfOrigin,
    this.dateSaved,
  });

  
  String get formatLabel {
    switch (countryOfOrigin) {
      case 'KR':
        return 'MANHWA';
      case 'CN':
        return 'MANHUA';
      default:
        return 'MANGA';
    }
  }

  
  Map<String, dynamic> toMap() => {
        'titleId': titleId,
        'title': title,
        'coverUrl': coverUrl,
        'synopsis': synopsis,
        'genres': genres,
        'chapterCount': chapterCount,
        'countryOfOrigin': countryOfOrigin,
        'dateSaved': dateSaved?.toIso8601String(),
      };

  factory MangaTitle.fromMap(Map<String, dynamic> map) => MangaTitle(
        titleId: map['titleId'] as int? ?? 0,
        title: map['title'] as String? ?? 'Untitled',
        coverUrl: map['coverUrl'] as String? ?? '',
        synopsis: map['synopsis'] as String? ?? '',
        genres: (map['genres'] as List?)?.map((g) => g.toString()).toList() ??
            const [],
        chapterCount: map['chapterCount'] as int? ?? 0,
        countryOfOrigin: map['countryOfOrigin'] as String? ?? 'JP',
        dateSaved: map['dateSaved'] != null
            ? DateTime.tryParse(map['dateSaved'] as String)
            : null,
      );


  factory MangaTitle.fromAniList(Map<String, dynamic> json) => MangaTitle(
        titleId: json['id'] as int,
        title: (json['title']?['romaji'] as String?) ??
            (json['title']?['english'] as String?) ??
            'Untitled',
        coverUrl: json['coverImage']?['large'] as String? ?? '',
        synopsis: (json['description'] as String? ?? '')
            .replaceAll(RegExp(r'<[^>]*>'), ''), 
        genres: (json['genres'] as List?)?.map((g) => g.toString()).toList() ??
            const [],
        chapterCount: json['chapters'] as int? ?? 0,
        countryOfOrigin: json['countryOfOrigin'] as String? ?? 'JP',
      );
}
