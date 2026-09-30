import 'package:flutter/material.dart';
import '../theme.dart';

class ListItemCard extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String year;
  final List<String> genres;
  final VoidCallback onTap;

  const ListItemCard({
    super.key,
    required this.thumbnailUrl,
    required this.title,
    required this.year,
    required this.genres,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: thumbnailUrl.isEmpty
                      ? Container(
                          color: AppColors.backgroundEnd,
                          child: const Icon(Icons.menu_book_rounded,
                              size: 20, color: AppColors.onSurfaceMuted),
                        )
                      : Image.network(thumbnailUrl, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    Text(year, style: Theme.of(context).textTheme.labelSmall),
                    if (genres.isNotEmpty)
                      Text(genres.join(' · '),
                          style: Theme.of(context).textTheme.labelSmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
