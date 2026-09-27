import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/anilist_service.dart';
import '../storage/title_store.dart';
import '../widgets/genre_chip.dart';
import '../widgets/format_toggle.dart';
import '../widgets/primary_button.dart';
import 'result_screen.dart';

const _genres = [
  'Romance', 'Action', 'Fantasy', 'Comedy', 'Drama', 'Horror', 'Slice of Life',
];
const _formats = ['Manga', 'Manhwa', 'Both'];

/// Owns the currently selected genres and format. Because this is a
/// StatefulWidget kept alive in an IndexedStack (see RootShell), this
/// selection survives both a tab switch and a Result-screen push/pop,
/// matching the revised proposal's "state persists on back" behaviour -
/// without needing to lift state any higher.
class HomeFilterScreen extends StatefulWidget {
  const HomeFilterScreen({super.key});

  @override
  State<HomeFilterScreen> createState() => _HomeFilterScreenState();
}

class _HomeFilterScreenState extends State<HomeFilterScreen> {
  final _service = AniListService();
  final _store = TitleStore();

  final Set<String> _selectedGenres = {};
  int _formatIndex = 2; // "Both" by default
  bool _loading = false;

  String? get _countryFilter =>
      switch (_formatIndex) { 0 => 'JP', 1 => 'KR', _ => null };

  Future<void> _spin() async {
    setState(() => _loading = true);
    try {
      final result = await _service.fetchRandomTitle(
        genres: _selectedGenres.toList(),
        countryOfOrigin: _countryFilter,
      );
      await _store.addToHistory(result);
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ResultScreen(initial: result)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not fetch a title: $e')),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: appBackgroundGradient),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ReadRoulette', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  'Discover your next read.\nSpin the roulette based on what you\'re in the mood for.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text('Select Genres', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: _genres.map((g) {
                  final selected = _selectedGenres.contains(g);
                  return GenreChip(
                    label: g,
                    selected: selected,
                    onTap: () => setState(() {
                      selected ? _selectedGenres.remove(g) : _selectedGenres.add(g);
                    }),
                  );
                }).toList(),
              ),
              const SizedBox(height: AppSpacing.md),
              Text('Format', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.sm),
              FormatToggle(
                options: _formats,
                selectedIndex: _formatIndex,
                onChanged: (i) => setState(() => _formatIndex = i),
              ),
              const Spacer(),
              PrimaryButton(
                label: _loading ? 'Spinning...' : 'Spin the Roulette',
                icon: Icons.casino_outlined,
                onPressed: _loading ? null : _spin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
