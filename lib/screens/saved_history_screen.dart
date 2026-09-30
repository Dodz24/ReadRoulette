import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/manga_title.dart';
import '../storage/title_store.dart';
import '../widgets/list_item_card.dart';
import 'result_screen.dart';

class SavedHistoryScreen extends StatefulWidget {
  const SavedHistoryScreen({super.key});

  @override
  State<SavedHistoryScreen> createState() => _SavedHistoryScreenState();
}

class _SavedHistoryScreenState extends State<SavedHistoryScreen>
    with SingleTickerProviderStateMixin {
  final _store = TitleStore();
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  List<MangaTitle> _saved = [];
  List<MangaTitle> _history = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final saved = await _store.loadSaved();
    final history = await _store.loadHistory();
    if (!mounted) return;
    setState(() {
      _saved = saved.reversed.toList(); 
      _history = history; 
      _loading = false;
    });
  }

  void _openTitle(MangaTitle title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ResultScreen(initial: title)),
    ).then((_) => _load()); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: appBackgroundGradient),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg, AppSpacing.lg, AppSpacing.lg, 0),
              child: Text('Saved & History',
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            TabBar(
              controller: _tabController,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.onSurfaceMuted,
              indicatorColor: AppColors.primary,
              tabs: const [Tab(text: 'Saved'), Tab(text: 'Recently Viewed')],
            ),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : TabBarView(
                      controller: _tabController,
                      children: [
                        _buildList(_saved, 'Tap the bookmark on any roulette roll to keep it saved.'),
                        _buildList(_history, 'Titles you\'ve spun will show up here.'),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<MangaTitle> titles, String emptyMessage) {
    if (titles.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Text(emptyMessage,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: titles.length,
      itemBuilder: (context, i) {
        final t = titles[i];
        final year = t.dateSaved != null
            ? t.dateSaved!.year.toString()
            : t.formatLabel;
        return ListItemCard(
          thumbnailUrl: t.coverUrl,
          title: t.title,
          year: year,
          genres: t.genres,
          onTap: () => _openTitle(t),
        );
      },
    );
  }
}
