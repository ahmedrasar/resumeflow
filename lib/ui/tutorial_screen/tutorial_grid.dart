import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/resumeflow_localizations.dart';

import 'tutorial_card.dart';

class TutorialGrid extends StatelessWidget {
  const TutorialGrid({super.key});
  static const _numberOfCards = 3;

  List<TutorialCard> _buildCards(ResumeflowLocalizations l10n) {
    return [
      TutorialCard(
        step: 1,
        backgroundIconData: Icons.edit_note_rounded,
        header: l10n.createCardHeader,
        body: l10n.createCardBody,
      ),
      TutorialCard(
        step: 2,
        backgroundIconData: Icons.update_rounded,
        header: l10n.updateCardHeader,
        body: l10n.updateCardBody,
      ),
      TutorialCard(
        step: 3,
        backgroundIconData: Icons.share_rounded,
        header: l10n.shareCardHeader,
        body: l10n.shareCardBody,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final canFitThisCount = constraints.maxWidth ~/ 275;
        final crossAxisCount =
            canFitThisCount > _numberOfCards ? _numberOfCards : canFitThisCount;

        return SizedBox(
          width: constraints.maxWidth * 0.75,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
            crossAxisCount: crossAxisCount,
            children: _buildCards(ResumeflowLocalizations.of(context)),
          ),
        );
      },
    );
  }
}
