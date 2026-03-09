import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/theme_colors.dart';
import 'animated_counter.dart';

class MetricCardWidget extends StatefulWidget {
  final String icon;
  final double value;
  final String prefix;
  final String suffix;
  final String label;
  final String sublabel;
  final Color accentColor;

  const MetricCardWidget({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.sublabel,
    required this.accentColor,
    this.prefix = '',
    this.suffix = '',
  });

  @override
  State<MetricCardWidget> createState() => _MetricCardWidgetState();
}

class _MetricCardWidgetState extends State<MetricCardWidget> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: TC.surface(context),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered ? widget.accentColor : TC.border(context),
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.accentColor.withValues(alpha: 0.12),
                    blurRadius: 24,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.icon,
                  style: const TextStyle(fontSize: 28),
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: widget.accentColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            AnimatedCounter(
              value: widget.value,
              prefix: widget.prefix,
              suffix: widget.suffix,
              style: AppTextStyles.metricLarge(context).copyWith(
                color: widget.accentColor,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.label,
              style: AppTextStyles.cardTitle(context).copyWith(fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              widget.sublabel,
              style: AppTextStyles.bodySmall(context).copyWith(fontSize: 11),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 1800),
                curve: Curves.easeOut,
                builder: (context, val, _) {
                  return LinearProgressIndicator(
                    value: val,
                    backgroundColor: TC.surface2(context),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      widget.accentColor.withValues(alpha: 0.6),
                    ),
                    minHeight: 3,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
