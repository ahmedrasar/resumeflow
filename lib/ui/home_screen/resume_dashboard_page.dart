import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumeflow/ui/widgets/grid_background.dart';
import 'package:resumeflow/utils/adaptive_helper/adaptive_helper.dart';

class ResumeDashboardPage extends StatefulWidget {
  const ResumeDashboardPage({super.key});

  @override
  State<ResumeDashboardPage> createState() => _ResumeDashboardPageState();
}

class _ResumeDashboardPageState extends State<ResumeDashboardPage> {
  void _createNewResume(BuildContext context) {
    context.go('/create');
  }

  Widget _buildResumeGrid() {
    const crossAxisCount = 1;
    const itemCount = 1;

    return GridView.builder(
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount),
      itemBuilder: (context, index) {
        return;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final adaptiveHelper =
        AdaptiveHelper(width: MediaQuery.sizeOf(context).width);

    return Scaffold(
      body: GridBackground(
        child: _buildResumeGrid(),
      ),
      floatingActionButton: adaptiveHelper.isCompact()
          ? FloatingActionButton(
              onPressed: () => _createNewResume(context),
              child: const Icon(Icons.add_box_outlined),
            )
          : null,
    );
  }
}
