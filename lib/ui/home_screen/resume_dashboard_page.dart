import 'package:flutter/material.dart';
import 'package:resumeflow/ui/widgets/grid_background.dart';

class ResumeDashboardPage extends StatefulWidget {
  const ResumeDashboardPage({super.key});

  @override
  State<ResumeDashboardPage> createState() => _ResumeDashboardPageState();
}

class _ResumeDashboardPageState extends State<ResumeDashboardPage> {
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
    return Scaffold(
      body: GridBackground(
        child: _buildResumeGrid(),
      ),
    );
  }
}
