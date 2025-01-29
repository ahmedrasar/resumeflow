import 'dart:math';

import 'package:flutter/material.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';

import 'tutorial_card.dart';

class TutorialGrid extends StatelessWidget {
  static const maxCardWidth = 400.0;

  const TutorialGrid({super.key});
  static const _numberOfCards = 3;

  List<TutorialCard> _buildCards(ResumeflowLocalizations l10n) {
    var step = 0;

    return [
      TutorialCard(
        step: ++step,
        backgroundIconData: Icons.edit_note_rounded,
        header: l10n.createCard,
        body: l10n.createCardBody,
      ),
      TutorialCard(
        step: ++step,
        backgroundIconData: Icons.update_rounded,
        header: l10n.updateCard,
        body: l10n.updateCardBody,
      ),
      TutorialCard(
        step: ++step,
        backgroundIconData: Icons.share_rounded,
        header: l10n.shareCard,
        body: l10n.shareCardBody,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final canFitThisCount = max(constraints.maxWidth ~/ maxCardWidth, 1);
        final crossAxisCount = min(canFitThisCount, _numberOfCards);
        final cardWidth =
            min(constraints.maxWidth / crossAxisCount, maxCardWidth);

        return SizedBox(
          width: cardWidth * crossAxisCount,
          child: GridView.count(
            shrinkWrap: true,
            primary: false,
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
            children: _buildCards(ResumeflowLocalizations.of(context)),
          ),
        );
      },
    );
  }
}
