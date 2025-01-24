import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/ui/widgets/grid_background.dart';

class CoverletterDashboardPage extends StatelessWidget {
  const CoverletterDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridBackground(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.75,
        ),
        padding: const EdgeInsets.all(20),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return _buildCoverletterTile(context);
        },
      ),
    );
  }

  Widget _buildCoverletterTile(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/home/cover-letters/create'),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: ColoredBox(
                  color: Theme.of(context).colorScheme.tertiary.withAlpha(100),
                  child: SizedBox.expand(
                    child: Icon(
                      Icons.mail,
                      size: 75,
                    ),
                  ),
                ),
              ),
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
