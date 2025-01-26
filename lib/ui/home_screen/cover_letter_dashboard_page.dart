import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/ui/widgets/grid_background.dart';

class CoverLetterDashboardPage extends StatelessWidget {
  const CoverLetterDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridBackground(
      child: Builder(builder: (context) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.75,
          ),
          padding: const EdgeInsets.all(20),
          itemCount: 1,
          itemBuilder: (_, int index) {
            // For unuknown reason the grid builder context does not rebuild the widget
            return _buildCoverletterTile(context);
          },
        );
      }),
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
                  color: Theme.of(context).colorScheme.tertiary,
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
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
