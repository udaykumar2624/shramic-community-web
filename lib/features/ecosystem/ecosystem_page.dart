import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/theme_colors.dart';
import '../../models/eco_node_model.dart';
import '../../services/mock_data_service.dart';
import '../home/widgets/nav_bar.dart';
import 'widgets/connection_lines.dart';
import 'widgets/eco_node_widget.dart';

class EcosystemPage extends StatefulWidget {
  const EcosystemPage({super.key});

  @override
  State<EcosystemPage> createState() => _EcosystemPageState();
}

class _EcosystemPageState extends State<EcosystemPage> {
  final List<EcoNodeModel> _nodes = MockDataService.getEcoNodes();
  String? _selectedId;
  String? _hoveredId;

  EcoNodeModel? get _selectedNode => _selectedId == null
      ? null
      : _nodes.firstWhere((n) => n.id == _selectedId);

  bool _isConnected(String id) {
    if (_selectedId == null) return false;
    if (id == _selectedId) return false;
    final selected = _nodes.firstWhere((n) => n.id == _selectedId);
    final target = _nodes.firstWhere((n) => n.id == id);
    return selected.connections.contains(id) ||
        target.connections.contains(_selectedId);
  }

  List<EcoNodeModel> _getConnectedNodes(EcoNodeModel node) {
    return _nodes.where((n) {
      if (n.id == node.id) return false;
      return node.connections.contains(n.id) || n.connections.contains(node.id);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
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

                // Header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 80,
                    vertical: 48,
                  ),
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0.0, -0.5),
                      radius: 1.0,
                      colors: [
                        Color(0x108AB4FF),
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
                              'Back',
                              style: AppTextStyles.bodySmall(context),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text('COMMUNITY', style: AppTextStyles.label(context)),
                      const SizedBox(height: 8),
                      Text(
                        'Ecosystem',
                        style: AppTextStyles.h1(context).copyWith(
                          fontSize: isMobile ? 32 : 48,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: isMobile ? double.infinity : 560,
                        child: Text(
                          'An interconnected network of workers, organizations, NGOs, and government bodies driving fair labour change. Tap any node to explore.',
                          style: AppTextStyles.bodyMedium(context),
                        ),
                      ),
                    ],
                  ),
                ),

                // Main content
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 80,
                    vertical: 32,
                  ),
                  child: isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _ecosystemCanvas(context, isMobile),
                            const SizedBox(height: 24),
                            _detailPanel(context),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 6,
                              child: _ecosystemCanvas(context, isMobile),
                            ),
                            const SizedBox(width: 32),
                            SizedBox(
                              width: 300,
                              child: _detailPanel(context),
                            ),
                          ],
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

  Widget _ecosystemCanvas(BuildContext context, bool isMobile) {
    final canvasHeight = isMobile ? 420.0 : 540.0;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: canvasHeight,
      decoration: BoxDecoration(
        color: TC.surface(context),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: TC.border(context)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final canvasSize = Size(constraints.maxWidth, canvasHeight);

            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 1.0,
                      colors: [
                        isDark
                            ? const Color(0x083DFFA0)
                            : const Color(0x063DFFA0),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                CustomPaint(
                  size: canvasSize,
                  painter: ConnectionLines(
                    nodes: _nodes,
                    canvasSize: canvasSize,
                    hoveredId: _hoveredId ?? _selectedId,
                  ),
                ),
                ..._nodes.asMap().entries.map((entry) {
                  final i = entry.key;
                  final node = entry.value;
                  final left = node.x * canvasSize.width - node.size / 2;
                  final top = node.y * canvasSize.height - node.size / 2;

                  return Positioned(
                    left: left.clamp(0, canvasSize.width - node.size),
                    top: top.clamp(0, canvasSize.height - node.size),
                    child: EcoNodeWidget(
                      node: node,
                      isSelected: _selectedId == node.id,
                      isConnected: _isConnected(node.id),
                      animationOffset: i * 0.4,
                      onTap: () {
                        setState(() {
                          _selectedId = _selectedId == node.id ? null : node.id;
                        });
                      },
                      onHover: (hovered) {
                        setState(() {
                          _hoveredId = hovered ? node.id : null;
                        });
                      },
                    ),
                  );
                }),
                if (_selectedId == null)
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: TC.surface2(context),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: TC.border(context)),
                        ),
                        child: Text(
                          '👆 Tap any node to explore',
                          style: AppTextStyles.bodySmall(context),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _detailPanel(BuildContext context) {
    if (_selectedNode == null) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: TC.surface(context),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: TC.border(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Node Details', style: AppTextStyles.h3(context)),
            const SizedBox(height: 10),
            Text(
              'Tap any node to see its role and connections.',
              style: AppTextStyles.bodyMedium(context),
            ),
            const SizedBox(height: 20),
            Text(
              'ALL NODES',
              style: AppTextStyles.label(context).copyWith(fontSize: 10),
            ),
            const SizedBox(height: 10),
            ..._nodes.map(
              (n) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: n.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(n.emoji, style: const TextStyle(fontSize: 13)),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        n.label,
                        style: AppTextStyles.bodySmall(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${_getConnectedNodes(n).length} links',
                      style: AppTextStyles.bodySmall(context).copyWith(
                        color: n.color,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    final node = _selectedNode!;
    final connectedNodes = _getConnectedNodes(node);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: TC.surface(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: node.color.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: node.color.withValues(alpha: 0.08),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Node header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: node.color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: node.color.withValues(alpha: 0.4),
                  ),
                ),
                child: Center(
                  child: Text(
                    node.emoji,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      node.label,
                      style: AppTextStyles.h3(context),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${connectedNodes.length} connections',
                      style: AppTextStyles.bodySmall(context).copyWith(
                        color: node.color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _selectedId = null),
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: TC.surface2(context),
                    shape: BoxShape.circle,
                    border: Border.all(color: TC.border(context)),
                  ),
                  child: Icon(
                    Icons.close,
                    color: TC.textMuted(context),
                    size: 13,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          Container(height: 1, color: TC.border(context)),
          const SizedBox(height: 12),

          // Description
          Text(
            node.description,
            style: AppTextStyles.bodySmall(context).copyWith(height: 1.5),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 16),

          Text(
            'CONNECTED TO (${connectedNodes.length})',
            style: AppTextStyles.label(context).copyWith(fontSize: 10),
          ),
          const SizedBox(height: 10),

          // Connected node chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: connectedNodes.map((n) {
              return GestureDetector(
                onTap: () => setState(() => _selectedId = n.id),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: n.color.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: n.color.withValues(alpha: 0.35),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        n.emoji,
                        style: const TextStyle(fontSize: 13),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        n.label,
                        style: AppTextStyles.bodySmall(context).copyWith(
                          color: n.color,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 16),
          Container(height: 1, color: TC.border(context)),
          const SizedBox(height: 12),

          // Tap hint
          Row(
            children: [
              Icon(
                Icons.touch_app_outlined,
                size: 13,
                color: TC.textMuted(context),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Tap a chip above to explore that node',
                  style: AppTextStyles.bodySmall(context).copyWith(
                    fontSize: 11,
                    color: TC.textMuted(context),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
