import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/manga_title.dart';

class AniListService {
  static const _endpoint = 'https://graphql.anilist.co';

  Future<MangaTitle> fetchRandomTitle({
    required List<String> genres,
    String? countryOfOrigin,
  }) async {
    final lastPage = await _fetchLastPage(genres, countryOfOrigin);
    final randomPage = Random().nextInt(lastPage) + 1; 
    final results = await _fetchPage(genres, countryOfOrigin, randomPage);

    if (results.isEmpty) {
      throw StateError('No titles found for the selected filters.');
    }
    return results[Random().nextInt(results.length)];
  }

  Future<int> _fetchLastPage(List<String> genres, String? country) async {
    final data = await _query(genres, country, page: 1, perPage: 1);
    final lastPage = data['Page']?['pageInfo']?['lastPage'] as int? ?? 1;
    return lastPage.clamp(1, 50);
  }

  Future<List<MangaTitle>> _fetchPage(
    List<String> genres,
    String? country,
    int page,
  ) async {
    final data = await _query(genres, country, page: page, perPage: 25);
    final media = (data['Page']?['media'] as List? ?? []);
    return media
        .map((m) => MangaTitle.fromAniList(m as Map<String, dynamic>))
        .toList();
  }

  Future<Map<String, dynamic>> _query(
    List<String> genres,
    String? country, {
    required int page,
    required int perPage,
  }) async {
    const query = r'''
      query ($genres: [String], $country: CountryCode, $page: Int, $perPage: Int) {
        Page(page: $page, perPage: $perPage) {
          pageInfo { lastPage }
          media(genre_in: $genres, countryOfOrigin: $country, type: MANGA, isAdult: false) {
            id
            title { romaji english }
            coverImage { large }
            description
            genres
            chapters
            countryOfOrigin
          }
        }
      }
    ''';

    final response = await http.post(
      Uri.parse(_endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'query': query,
        'variables': {
          'genres': genres.isEmpty ? null : genres,
          'country': country,
          'page': page,
          'perPage': perPage,
        },
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('AniList request failed (${response.statusCode})');
    }
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    if (body.containsKey('errors')) {
      throw Exception('AniList returned an error: ${body['errors']}');
    }
    return body['data'] as Map<String, dynamic>;
  }
}
