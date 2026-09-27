import 'package:flutter/material.dart';
import '../theme.dart';
import 'genre_chip.dart';

/// The Result screen's main content: cover, title, genres, chapter count,
/// synopsis. 
class ResultCard extends StatelessWidget {
  final String coverUrl;
  final String title;
  final List<String> genres;
  final int chapters;
  final String synopsis;

  const ResultCard({
    super.key,
    required this.coverUrl,
    required this.title,
    required this.genres,
    required this.chapters,
    required this.synopsis,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: coverUrl.isEmpty
                    ? Container(
                        color: AppColors.backgroundEnd,
                        child: const Icon(Icons.menu_book_rounded,
                            size: 48, color: AppColors.onSurfaceMuted),
                      )
                    : Image.network(
                        coverUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppColors.backgroundEnd,
                          child: const Icon(Icons.menu_book_rounded,
                              size: 48, color: AppColors.onSurfaceMuted),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.xs,
              children: genres
                  .map((g) => GenreChip(label: g, selected: false, onTap: () {}))
                  .toList(),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                const Icon(Icons.menu_book_outlined,
                    size: 14, color: AppColors.onSurfaceMuted),
                const SizedBox(width: 4),
                Text('Chapters: $chapters',
                    style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(synopsis, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
