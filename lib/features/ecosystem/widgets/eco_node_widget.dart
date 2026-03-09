import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/theme_colors.dart';
import '../../../models/eco_node_model.dart';

class EcoNodeWidget extends StatefulWidget {
  final EcoNodeModel node;
  final bool isSelected;
  final bool isConnected;
  final VoidCallback onTap;
  final ValueChanged<bool> onHover;
  final double animationOffset;

  const EcoNodeWidget({
    super.key,
    required this.node,
    required this.isSelected,
    required this.isConnected,
    required this.onTap,
    required this.onHover,
    required this.animationOffset,
  });

  @override
  State<EcoNodeWidget> createState() => _EcoNodeWidgetState();
}

class _EcoNodeWidgetState extends State<EcoNodeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatController;
  late Animation<double> _floatAnim;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat(reverse: true);

    _floatAnim = Tween<double>(begin: -8, end: 8).animate(
      CurvedAnimation(
        parent: _floatController,
        curve: Curves.easeInOut,
      ),
    );

    Future.delayed(
      Duration(milliseconds: (widget.animationOffset * 1000).toInt()),
      () {
        if (mounted) _floatController.forward();
      },
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final node = widget.node;
    final isActive = widget.isSelected || widget.isConnected;

    return AnimatedBuilder(
      animation: _floatAnim,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnim.value),
          child: child,
        );
      },
      child: MouseRegion(
        onEnter: (_) => widget.onHover(true),
        onExit: (_) => widget.onHover(false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: node.size,
            height: node.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive
                  ? node.color.withValues(alpha: 0.25)
                  : node.color.withValues(alpha: 0.12),
              border: Border.all(
                color:
                    isActive ? node.color : node.color.withValues(alpha: 0.4),
                width: isActive ? 2.5 : 1.5,
              ),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: node.color.withValues(alpha: 0.3),
                        blurRadius: 20,
                        spreadRadius: 4,
                      ),
                    ]
                  : [],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  node.emoji,
                  style: TextStyle(fontSize: node.size * 0.32),
                ),
                const SizedBox(height: 2),
                Text(
                  node.label,
                  style: AppTextStyles.bodySmall(context).copyWith(
                    fontSize: node.size * 0.13,
                    color: isActive ? node.color : TC.textMuted(context),
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
