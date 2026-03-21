import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/theme_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../models/story_model.dart';
import '../../models/persona_model.dart';
import '../../services/mock_data_service.dart';
import '../../services/translation_service.dart';
import '../../providers/language_provider.dart';
import 'widgets/nav_bar.dart';
import 'widgets/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen to language changes to rebuild
    context.watch<LanguageProvider>();

    final metrics = MockDataService.getMetrics();
    final stories = MockDataService.getStories();
    final personas = MockDataService.getPersonas();
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final padding = EdgeInsets.symmetric(
      horizontal: isMobile ? 24 : 80,
      vertical: 60,
    );

    return Scaffold(
      backgroundColor: TC.bg(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 72),
                const HeroSection(),

                // Metrics
                Container(
                  width: double.infinity,
                  color: TC.surface(context),
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionLabel(
                        context,
                        TranslationService.t('metrics_label'),
                      ),
                      Text(
                        TranslationService.t('metrics_title'),
                        style: AppTextStyles.h2(context),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        TranslationService.t('metrics_desc'),
                        style: AppTextStyles.bodyMedium(context),
                      ),
                      const SizedBox(height: 36),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isMobile ? 2 : 4,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: isMobile ? 1.0 : 1.3,
                        ),
                        itemCount: metrics.length,
                        itemBuilder: (context, i) {
                          final m = metrics[i];
                          final color = m.color == 'yellow'
                              ? AppColors.accentYellow
                              : m.color == 'red'
                                  ? AppColors.accentRed
                                  : AppColors.accent;
                          return _MetricCard(
                            icon: m.icon,
                            value: m.value,
                            label: TranslationService.t(
                              i == 0
                                  ? 'stats_workers'
                                  : i == 1
                                      ? 'stats_wages'
                                      : i == 2
                                          ? 'stats_orgs'
                                          : 'stats_states',
                            ),
                            valueColor: color,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // Stories
                Container(
                  width: double.infinity,
                  color: TC.bg(context),
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionLabel(
                        context,
                        TranslationService.t('stories_label'),
                      ),
                      Text(
                        TranslationService.t('stories_title'),
                        style: AppTextStyles.h2(context),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        TranslationService.t('stories_desc'),
                        style: AppTextStyles.bodyMedium(context),
                      ),
                      const SizedBox(height: 36),
                      SizedBox(
                        height: 280,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: stories.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 16),
                          itemBuilder: (context, i) {
                            final s = stories[i];
                            final color = s.avatarColor == 'yellow'
                                ? AppColors.accentYellow
                                : s.avatarColor == 'red'
                                    ? AppColors.accentRed
                                    : s.avatarColor == 'blue'
                                        ? AppColors.accentBlue
                                        : AppColors.accent;
                            return _StoryCard(
                              story: s,
                              accentColor: color,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Personas
                Container(
                  width: double.infinity,
                  color: TC.surface(context),
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionLabel(
                        context,
                        TranslationService.t('personas_label'),
                      ),
                      Text(
                        TranslationService.t('personas_title'),
                        style: AppTextStyles.h2(context),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        TranslationService.t('personas_desc'),
                        style: AppTextStyles.bodyMedium(context),
                      ),
                      const SizedBox(height: 36),
                      _PersonasSection(personas: personas),
                    ],
                  ),
                ),

                // Footer
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 80,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: TC.border(context)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TranslationService.t('footer_copy'),
                        style: AppTextStyles.bodySmall(context),
                      ),
                      RichText(
                        text: TextSpan(
                          style: AppTextStyles.bodySmall(context),
                          children: [
                            TextSpan(
                              text: TranslationService.t('footer_built'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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

  Widget _sectionLabel(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label.toUpperCase(),
        style: AppTextStyles.label(context),
      ),
    );
  }
}

// Metric Card
class _MetricCard extends StatefulWidget {
  final String icon;
  final String value;
  final String label;
  final Color valueColor;

  const _MetricCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.valueColor,
  });

  @override
  State<_MetricCard> createState() => _MetricCardState();
}

class _MetricCardState extends State<_MetricCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: TC.surface(context),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered ? AppColors.accent : TC.border(context),
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.1),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                widget.value,
                style: AppTextStyles.metricMedium(context).copyWith(
                  color: widget.valueColor,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.label,
              style: AppTextStyles.bodySmall(context).copyWith(fontSize: 11),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// Story Card
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
        width: 300,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: TC.surface(context),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered ? AppColors.accent : TC.border(context),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: widget.accentColor.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      widget.story.avatarLetter,
                      style: AppTextStyles.h3(context).copyWith(
                        color: widget.accentColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.story.name,
                        style: AppTextStyles.cardTitle(context),
                      ),
                      Text(
                        '${widget.story.role} · ${widget.story.location}',
                        style: AppTextStyles.cardSubtitle(context),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Text(
                '"${widget.story.quote}"',
                style: AppTextStyles.bodySmall(context).copyWith(
                  fontStyle: FontStyle.italic,
                  height: 1.6,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: widget.accentColor.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: TC.border(context)),
              ),
              child: Text(
                widget.story.impact,
                style: AppTextStyles.bodySmall(context).copyWith(
                  color: widget.accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Personas Section
class _PersonasSection extends StatefulWidget {
  final List<PersonaModel> personas;
  const _PersonasSection({required this.personas});

  @override
  State<_PersonasSection> createState() => _PersonasSectionState();
}

class _PersonasSectionState extends State<_PersonasSection> {
  int? _selected;

  @override
  Widget build(BuildContext context) {
    // Listen to language changes
    context.watch<LanguageProvider>();
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 2 : 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: widget.personas.length,
          itemBuilder: (context, i) {
            final p = widget.personas[i];
            final isSelected = _selected == i;
            return GestureDetector(
              onTap: () => setState(() => _selected = isSelected ? null : i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color:
                      isSelected ? TC.surface2(context) : TC.surface(context),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? AppColors.accent : TC.border(context),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(p.emoji, style: const TextStyle(fontSize: 32)),
                    const SizedBox(height: 8),
                    Text(
                      p.name,
                      style: AppTextStyles.cardTitle(context)
                          .copyWith(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        p.title,
                        style: AppTextStyles.cardSubtitle(context)
                            .copyWith(fontSize: 11),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        if (_selected != null) ...[
          const SizedBox(height: 20),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: TC.surface2(context),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: TC.border(context)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.personas[_selected!].emoji,
                      style: const TextStyle(fontSize: 32),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.personas[_selected!].name,
                            style: AppTextStyles.h3(context),
                          ),
                          Text(
                            widget.personas[_selected!].painPoint,
                            style: AppTextStyles.bodySmall(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  widget.personas[_selected!].description,
                  style: AppTextStyles.bodyMedium(context).copyWith(
                    color: TC.textPrimary(context),
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.personas[_selected!].needs
                      .map(
                        (n) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.accent.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: TC.border(context)),
                          ),
                          child: Text(
                            '→ $n',
                            style: AppTextStyles.bodySmall(context).copyWith(
                              color: AppColors.accent,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
