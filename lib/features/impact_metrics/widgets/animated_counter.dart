import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';

class AnimatedCounter extends StatelessWidget {
  final double value;
  final String prefix;
  final String suffix;
  final TextStyle? style;

  const AnimatedCounter({
    super.key,
    required this.value,
    this.prefix = '',
    this.suffix = '',
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: value),
      duration: const Duration(milliseconds: 1800),
      curve: Curves.easeOut,
      builder: (context, val, _) {
        return Text(
          '$prefix${val.toInt().toString().replaceAllMapped(
                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (m) => '${m[1]},',
              )}$suffix',
          style: style ?? AppTextStyles.metricLarge(context),
        );
      },
    );
  }
}
