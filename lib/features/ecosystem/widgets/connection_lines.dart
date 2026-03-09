import 'package:flutter/material.dart';
import '../../../models/eco_node_model.dart';
import '../../../core/theme/app_colors.dart';

class ConnectionLines extends CustomPainter {
  final List<EcoNodeModel> nodes;
  final String? hoveredId;
  final Size canvasSize;

  ConnectionLines({
    required this.nodes,
    required this.canvasSize,
    this.hoveredId,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final nodeMap = {for (var n in nodes) n.id: n};

    // Collect ALL unique pairs bidirectionally
    final Set<String> drawnPairs = {};

    for (final node in nodes) {
      for (final connId in node.connections) {
        final target = nodeMap[connId];
        if (target == null) continue;

        // Create a canonical key so A→B and B→A are treated as same pair
        final ids = [node.id, connId]..sort();
        final pairKey = '${ids[0]}_${ids[1]}';

        if (drawnPairs.contains(pairKey)) continue;
        drawnPairs.add(pairKey);

        final isHighlighted = hoveredId == node.id || hoveredId == connId;

        final start = Offset(
          node.x * canvasSize.width,
          node.y * canvasSize.height,
        );
        final end = Offset(
          target.x * canvasSize.width,
          target.y * canvasSize.height,
        );

        // Glow effect for highlighted lines
        if (isHighlighted) {
          final glowPaint = Paint()
            ..color = AppColors.accent.withValues(alpha: 0.15)
            ..strokeWidth = 8
            ..style = PaintingStyle.stroke
            ..strokeCap = StrokeCap.round;
          canvas.drawLine(start, end, glowPaint);
        }

        // Main line
        final paint = Paint()
          ..color = isHighlighted
              ? AppColors.accent.withValues(alpha: 0.8)
              : AppColors.border.withValues(alpha: 0.4)
          ..strokeWidth = isHighlighted ? 2.5 : 1.2
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

        _drawDashedLine(canvas, start, end, paint);
      }
    }
  }

  void _drawDashedLine(
    Canvas canvas,
    Offset start,
    Offset end,
    Paint paint,
  ) {
    const dashLength = 6.0;
    const gapLength = 4.0;
    final total = (end - start).distance;
    final dir = (end - start) / total;
    double drawn = 0;
    bool drawing = true;

    while (drawn < total) {
      final segLen = drawing ? dashLength : gapLength;
      final next = drawn + segLen;
      if (drawing) {
        canvas.drawLine(
          start + dir * drawn,
          start + dir * (next > total ? total : next),
          paint,
        );
      }
      drawn = next;
      drawing = !drawing;
    }
  }

  @override
  bool shouldRepaint(ConnectionLines old) =>
      old.hoveredId != hoveredId || old.nodes != nodes;
}
