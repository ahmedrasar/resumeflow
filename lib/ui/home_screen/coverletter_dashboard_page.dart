import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/ui/widgets/grid_background.dart';

class CoverletterDashboardPage extends StatelessWidget {
  const CoverletterDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridBackground(
      child: _buildCoverletterTile(context),
    );
  }

  Widget _buildCoverletterTile(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 250,
      child: Card.filled(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.mail,
              size: 75,
            ),
            Text(
              ResumeflowLocalizations.of(context).createCoverLetter,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
