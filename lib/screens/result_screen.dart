import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/manga_title.dart';
import '../services/anilist_service.dart';
import '../storage/title_store.dart';
import '../widgets/result_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/back_arrow_button.dart';


class ResultScreen extends StatefulWidget {
  final MangaTitle initial;
  const ResultScreen({super.key, required this.initial});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final _service = AniListService();
  final _store = TitleStore();
  late MangaTitle _current = widget.initial;
  bool _loading = false;
  bool _saved = false;

  Future<void> _spinAgain() async {
    setState(() => _loading = true);
    try {
      final next = await _service.fetchRandomTitle(
        genres: _current.genres,
        countryOfOrigin: _current.countryOfOrigin,
      );
      await _store.addToHistory(next);
      if (!mounted) return;
      setState(() {
        _current = next;
        _saved = false;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not fetch a new title: $e')),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _save() async {
    await _store.addToSaved(_current);
    if (!mounted) return;
    setState(() => _saved = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Saved to your library.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: appBackgroundGradient),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                BackArrowButton(onPressed: () => Navigator.pop(context)),
                Expanded(
                  child: Text('ReadRoulette',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                const SizedBox(width: 48), 
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: ResultCard(
                  coverUrl: _current.coverUrl,
                  title: _current.title,
                  genres: _current.genres,
                  chapters: _current.chapterCount,
                  synopsis: _current.synopsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      label: _loading ? 'Spinning...' : 'Spin Again',
                      icon: Icons.casino_outlined,
                      onPressed: _loading ? null : _spinAgain,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: PrimaryButton(
                      label: _saved ? 'Saved' : 'Save',
                      icon: Icons.bookmark_border,
                      outlined: true,
                      onPressed: _saved ? null : _save,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
