import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/manga_title.dart';

class TitleStore {
  static const _savedKey = 'savedTitles';
  static const _historyKey = 'recentlyViewed';

  Future<List<MangaTitle>> loadSaved() => _load(_savedKey);
  Future<List<MangaTitle>> loadHistory() => _load(_historyKey);

  Future<void> saveSaved(List<MangaTitle> titles) => _save(_savedKey, titles);
  Future<void> saveHistory(List<MangaTitle> titles) =>
      _save(_historyKey, titles);

  Future<List<MangaTitle>> _load(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(key) ?? [];
    return raw
        .map((s) => MangaTitle.fromMap(jsonDecode(s) as Map<String, dynamic>))
        .toList();
  }

  Future<void> _save(String key, List<MangaTitle> titles) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = titles.map((t) => jsonEncode(t.toMap())).toList();
    await prefs.setStringList(key, raw);
  }

  Future<void> addToSaved(MangaTitle title) async {
    final current = await loadSaved();
    if (current.any((t) => t.titleId == title.titleId)) return;
    final withDate = MangaTitle(
      titleId: title.titleId,
      title: title.title,
      coverUrl: title.coverUrl,
      synopsis: title.synopsis,
      genres: title.genres,
      chapterCount: title.chapterCount,
      countryOfOrigin: title.countryOfOrigin,
      dateSaved: DateTime.now(),
    );
    await saveSaved([...current, withDate]);
  }

  Future<void> addToHistory(MangaTitle title) async {
    final current = await loadHistory();
    final updated = [title, ...current.where((t) => t.titleId != title.titleId)];
    await saveHistory(updated.take(50).toList());
  }
}
