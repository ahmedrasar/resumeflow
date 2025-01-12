import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/resumeflow_localizations.dart';

import 'tutorial_card.dart';

class TutorialGrid extends StatelessWidget {
  const TutorialGrid({super.key});
  static const _numberOfCards = 3;

  List<TutorialCard> _buildCards(ResumeflowLocalizations l10n) {
    var step = 0;

    return [
      TutorialCard(
        step: ++step,
        backgroundIconData: Icons.edit_note_rounded,
        header: l10n.createCardHeader,
        body: l10n.createCardBody,
      ),
      TutorialCard(
        step: ++step,
        backgroundIconData: Icons.update_rounded,
        header: l10n.updateCardHeader,
        body: l10n.updateCardBody,
      ),
      TutorialCard(
        step: ++step,
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
        const maxWidth = 400.0;

        final canFitThisCount = constraints.maxWidth ~/ maxWidth;
        final crossAxisCount =
            canFitThisCount > _numberOfCards ? _numberOfCards : canFitThisCount;

        return SizedBox(
          width: maxWidth * crossAxisCount,
          child: GridView.extent(
            shrinkWrap: true,
            maxCrossAxisExtent: maxWidth,
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
