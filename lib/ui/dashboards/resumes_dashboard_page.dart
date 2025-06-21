import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/router/routes.dart';
import 'package:resumeflow/ui/dashboards/dashboard.dart';

class ResumesDashboardPage extends StatelessWidget {
  const ResumesDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = ResumeflowLocalizations.of(context);
    return Dashboard(
      createLabel: l10n.createResume,
      icon: Icons.article,
      createCardOnTap: () {
        context.go(AppRoutes.resume.full);
      },
    );
  }
}
