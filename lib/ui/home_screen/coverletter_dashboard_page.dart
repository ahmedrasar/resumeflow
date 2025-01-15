import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumeflow/ui/widgets/grid_background.dart';

class CoverletterDashboardPage extends StatelessWidget {
  const CoverletterDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridBackground(
      child: _prototype(context),
    );
  }

  Widget _prototype(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => context.go('/home/cover-letters/create'),
        child: Text('create'),
      ),
    );
  }
}
