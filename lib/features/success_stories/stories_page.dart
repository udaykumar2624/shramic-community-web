import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/theme_colors.dart';
import '../../models/story_model.dart';
import '../../providers/language_provider.dart';
import '../../services/mock_data_service.dart';
import '../../services/translation_service.dart';
import '../home/widgets/nav_bar.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<LanguageProvider>();
    final stories = MockDataService.getStories();
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Scaffold(
      backgroundColor: TC.bg(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 72),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 80,
                    vertical: 48,
                  ),
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0.3, -0.5),
                      radius: 1.0,
                      colors: [
                        Color(0x10FFCD3D),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: TC.textMuted(context),
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              TranslationService.t('back'),
                              style: AppTextStyles.bodySmall(context),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        TranslationService.t('stories_label').toUpperCase(),
                        style: AppTextStyles.label(context),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        TranslationService.t('stories_title'),
                        style: AppTextStyles.h1(context).copyWith(
                          fontSize: isMobile ? 32 : 48,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        TranslationService.t('stories_desc'),
                        style: AppTextStyles.bodyMedium(context),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 80,
                    vertical: 32,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: isMobile ? 1.4 : 1.6,
                    ),
                    itemCount: stories.length,
                    itemBuilder: (context, i) {
                      final s = stories[i];
                      final color = s.avatarColor == 'yellow'
                          ? AppColors.accentYellow
                          : s.avatarColor == 'red'
                              ? AppColors.accentRed
                              : s.avatarColor == 'blue'
                                  ? AppColors.accentBlue
                                  : AppColors.accent;
                      return _StoryCard(story: s, accentColor: color);
                    },
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(),
          ),
        ],
      ),
    );
  }
}

class _StoryCard extends StatefulWidget {
  final StoryModel story;
  final Color accentColor;

  const _StoryCard({required this.story, required this.accentColor});

  @override
  State<_StoryCard> createState() => _StoryCardState();
}

class _StoryCardState extends State<_StoryCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: TC.surface(context),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered ? widget.accentColor : TC.border(context),
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.accentColor.withValues(alpha: 0.1),
                    blurRadius: 20,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: widget.accentColor.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      widget.story.avatarLetter,
                      style: AppTextStyles.h3(context).copyWith(
                        color: widget.accentColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.story.name,
                        style: AppTextStyles.cardTitle(context)
                            .copyWith(fontSize: 16),
                      ),
                      Text(
                        widget.story.role,
                        style: AppTextStyles.cardSubtitle(context),
                      ),
                      Text(
                        widget.story.location,
                        style: AppTextStyles.bodySmall(context).copyWith(
                          color: widget.accentColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Text(
                '"${widget.story.quote}"',
                style: AppTextStyles.bodyMedium(context).copyWith(
                  fontStyle: FontStyle.italic,
                  height: 1.7,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: widget.accentColor.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: widget.accentColor.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                '🎯 ${widget.story.impact}',
                style: AppTextStyles.bodySmall(context).copyWith(
                  color: widget.accentColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
